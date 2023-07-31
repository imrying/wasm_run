// Use a procedural macro to generate bindings for the world we specified in `y-crdt.wit`
wit_bindgen::generate!("y-crdt");

use exports::y_crdt_namespace::y_crdt::y_doc_methods::*;
use lib0::any::Any;
use std::cell::RefCell;
use std::collections::HashMap;
use std::convert::TryFrom;
use std::mem::ManuallyDrop;
use std::ops::Deref;
use std::rc::Rc;
use std::sync::Arc;
use yrs::block::{ClientID, ItemContent, Prelim, Unused};
use yrs::types::array::ArrayEvent;
use yrs::types::map::MapEvent;
use yrs::types::text::{ChangeKind, Diff, TextEvent, YChange};
use yrs::types::xml::{XmlEvent, XmlTextEvent};
use yrs::types::{
    Attrs, Branch, BranchPtr, Change, DeepEventsSubscription, DeepObservable, Delta, EntryChange,
    Event, Events, Path, PathSegment, ToJson, TypeRef, Value,
};
use yrs::undo::{EventKind, UndoEventSubscription};
use yrs::updates::decoder::{Decode, DecoderV1};
use yrs::updates::encoder::{Encode, Encoder, EncoderV1, EncoderV2};
use yrs::{
    Array, ArrayRef, Assoc, DeleteSet, DestroySubscription, Doc, GetString, IndexScope, Map,
    MapRef, Observable, Offset, Options, Origin, ReadTxn, Snapshot, StateVector, StickyIndex,
    Store, SubdocsEvent, SubdocsEventIter, SubdocsSubscription, Subscription, Text, TextRef,
    Transact, Transaction, TransactionCleanupEvent, TransactionCleanupSubscription, TransactionMut,
    UndoManager, Update, UpdateSubscription, Xml, XmlElementPrelim, XmlElementRef, XmlFragment,
    XmlFragmentRef, XmlNode, XmlTextPrelim, XmlTextRef, ID,
};

use once_cell::unsync::Lazy;

thread_local! {
    static IMAGES_MAP: Lazy<RefCell<GlobalState>> = Lazy::new(|| Default::default());
    static TXN_STATE: Lazy<RefCell<TxnState>> = Lazy::new(|| Default::default());
}

#[derive(Default)]
pub struct GlobalState {
    pub last_id: u32,
    pub docs: HashMap<u32, Doc>,
    pub texts: HashMap<u32, TextRef>,
    pub arrays: HashMap<u32, ArrayRef>,
    pub maps: HashMap<u32, MapRef>,
    pub xml_elements: HashMap<u32, XmlElementRef>,
    pub xml_fragments: HashMap<u32, XmlFragmentRef>,
    pub xml_texts: HashMap<u32, XmlTextRef>,
}

impl GlobalState {
    fn save_doc(&mut self, image: Doc) -> YDoc {
        let id = self.last_id;
        self.last_id += 1;
        let image_ref = YDoc { ref_: id };
        self.docs.insert(id, image);
        image_ref
    }

    fn save_text(&mut self, t: TextRef) -> YText {
        let id = self.last_id;
        self.last_id += 1;
        let v = YText { ref_: id };
        self.texts.insert(id, t);
        v
    }

    fn save_array(&mut self, t: ArrayRef) -> YArray {
        let id = self.last_id;
        self.last_id += 1;
        let v = YArray { ref_: id };
        self.arrays.insert(id, t);
        v
    }

    fn save_map(&mut self, t: MapRef) -> YMap {
        let id = self.last_id;
        self.last_id += 1;
        let v = YMap { ref_: id };
        self.maps.insert(id, t);
        v
    }

    fn save_xml_element(&mut self, t: XmlElementRef) -> YXmlElement {
        let id = self.last_id;
        self.last_id += 1;
        let v = YXmlElement { ref_: id };
        self.xml_elements.insert(id, t);
        v
    }

    fn save_xml_fragment(&mut self, t: XmlFragmentRef) -> YXmlFragment {
        let id = self.last_id;
        self.last_id += 1;
        let v = YXmlFragment { ref_: id };
        self.xml_fragments.insert(id, t);
        v
    }

    fn save_xml_text(&mut self, t: XmlTextRef) -> YXmlText {
        let id = self.last_id;
        self.last_id += 1;
        let v = YXmlText { ref_: id };
        self.xml_texts.insert(id, t);
        v
    }
}

#[derive(Default)]
pub struct TxnState {
    pub last_id: u32,
    pub transactions: HashMap<u32, Transaction<'static>>,
    pub transactions_mut: HashMap<u32, TransactionMut<'static>>,
}

impl TxnState {
    fn save_transaction(&mut self, t: Transaction<'static>) -> ReadTransaction {
        let id = self.last_id;
        self.last_id += 1;
        let v = ReadTransaction { ref_: id };
        self.transactions.insert(id, t);
        v
    }

    fn save_transaction_mut(&mut self, t: TransactionMut<'static>) -> WriteTransaction {
        let id = self.last_id;
        self.last_id += 1;
        let v = WriteTransaction { ref_: id };
        self.transactions_mut.insert(id, t); // Rc::new(RefCell::new(t)));
        v
    }
}

fn with_mut<T>(f: impl FnOnce(&mut GlobalState) -> T) -> T {
    IMAGES_MAP.with(|v| f(&mut v.borrow_mut()))
}

fn with<T>(f: impl FnOnce(&GlobalState) -> T) -> T {
    IMAGES_MAP.with(|v| f(&v.borrow()))
}

fn with_txn_state<T>(f: impl FnOnce(&mut TxnState) -> T) -> T {
    TXN_STATE.with(|v| f(&mut v.borrow_mut()))
}

fn operation<T>(image_ref: YDoc, f: impl FnOnce(&Doc) -> T) -> T {
    with(|state| {
        let img = &state.docs[&image_ref.ref_];
        f(img)
    })
}

fn with_mut_all<T>(f: impl FnOnce(&mut GlobalState, &mut TxnState) -> T) -> T {
    IMAGES_MAP.with(|v| TXN_STATE.with(|state| f(&mut v.borrow_mut(), &mut state.borrow_mut())))
}

fn with_txn<T>(t: YTransaction, f: impl FnOnce(&YTransactionInner) -> T) -> T {
    TXN_STATE.with(|state| {
        let mut m = state.borrow_mut();
        let t = YTransactionInner::from_ref(t, &mut m);
        f(&t)
    })
}

struct YTransactionInner<'a>(InnerTxn<'a>);

enum InnerTxn<'a> {
    ReadOnly(&'a Transaction<'static>),
    ReadWrite(&'a mut TransactionMut<'static>),
}

impl<'a> YTransactionInner<'a> {
    fn from_ref(txn: YTransaction, state: &'a mut TxnState) -> Self {
        match txn {
            YTransaction::ReadTransaction(t) => {
                let txn = &state.transactions[&t.ref_];
                YTransactionInner(InnerTxn::ReadOnly(txn))
            }
            YTransaction::WriteTransaction(t) => {
                let txn = state.transactions_mut.get_mut(&t.ref_).unwrap();
                YTransactionInner(InnerTxn::ReadWrite(txn))
            }
        }
    }

    fn from_transact<T: Transact>(
        txn: ImplicitTransaction,
        transact: &'a T,
        state: &'a mut TxnState,
    ) -> Self {
        txn.map(|t| YTransactionInner::from_ref(t, state))
            .unwrap_or_else(|| {
                YTransactionInner(InnerTxn::ReadOnly(unsafe {
                    std::mem::transmute(&transact.transact())
                }))
            })
    }

    fn from_transact_mut<T: Transact>(
        txn: ImplicitTransaction,
        transact: T,
        state: &mut TxnState,
    ) -> &mut TransactionMut<'static> {
        match txn {
            Some(YTransaction::WriteTransaction(txn)) => {
                state.transactions_mut.get_mut(&txn.ref_).unwrap()
            }
            _ => unsafe { std::mem::transmute(&mut transact.transact_mut()) },
        }
    }

    fn try_mut(&mut self) -> Option<&mut TransactionMut<'static>> {
        match &mut self.0 {
            InnerTxn::ReadOnly(_) => None,
            InnerTxn::ReadWrite(txn) => Some(txn),
        }
    }

    fn try_apply(&mut self, update: Update) -> Result<(), String> {
        if let Some(txn) = self.try_mut() {
            txn.apply_update(update);
            Ok(())
        } else {
            Err("cannot apply an update using a read-only transaction".to_string())
        }
    }
}

impl<'a> ReadTxn for YTransactionInner<'a> {
    fn store(&self) -> &Store {
        match &self.0 {
            InnerTxn::ReadOnly(txn) => txn.store(),
            InnerTxn::ReadWrite(txn) => txn.store(),
        }
    }
}

enum SharedType<T, P> {
    Integrated(T),
    Prelim(P),
}

impl<T, P> SharedType<T, P> {
    #[inline(always)]
    fn new(value: T) -> RefCell<Self> {
        RefCell::new(SharedType::Integrated(value))
    }

    #[inline(always)]
    fn prelim(prelim: P) -> RefCell<Self> {
        RefCell::new(SharedType::Prelim(prelim))
    }

    fn as_integrated(&self) -> Option<&T> {
        if let SharedType::Integrated(value) = self {
            Some(value)
        } else {
            None
        }
    }
}

struct YTextInner(RefCell<SharedType<TextRef, String>>);

// Comment out the following lines to include other generated wit interfaces
// use exports::y_crdt_namespace::y_crdt::*;
// use y_crdt_namespace::y_crdt::interface_name;

// Define a custom type and implement the generated trait for it which represents
// implementing all the necessary exported interfaces for this component.
struct WitImplementation;

export_y_crdt!(WitImplementation);

impl YCrdt for WitImplementation {
    fn run(value: Model) -> Result<f64, String> {
        let mapped = map_integer(value.integer);
        if mapped.is_nan() {
            Err("NaN returned from map_integer".to_string())
        } else {
            Ok(mapped)
        }
    }
}

fn parse_options(options: YDocOptions) -> Options {
    let mut opts = Options::default();
    opts.client_id = options.client_id;
    opts.guid = options.guid.into();
    opts.collection_id = options.collection_id;
    opts.offset_kind = match options.offset_kind {
        OffsetKind::Utf16 => yrs::OffsetKind::Utf16,
        OffsetKind::Utf32 => yrs::OffsetKind::Utf32,
        OffsetKind::Bytes => yrs::OffsetKind::Bytes,
    };
    opts.skip_gc = options.skip_gc;
    opts.auto_load = options.auto_load;
    opts.should_load = options.should_load;
    opts
}

impl YDocMethods for WitImplementation {
    fn y_doc_new(options: Option<YDocOptions>) -> YDoc {
        let options = options.map(parse_options).unwrap_or_default();
        with_mut(|m| m.save_doc(Doc::with_options(options)))
    }

    fn y_doc_parent_doc(doc: YDoc) -> Option<YDoc> {
        with_mut(|state| {
            let img = &state.docs[&doc.ref_];
            img.parent_doc().map(|d| state.save_doc(d))
        })
    }

    fn y_doc_id(doc: YDoc) -> u64 {
        operation(doc, |doc| doc.client_id())
    }

    fn y_doc_guid(doc: YDoc) -> String {
        operation(doc, |doc| doc.guid().to_string())
    }

    fn y_doc_read_transaction(doc: YDoc) -> ReadTransaction {
        with_mut_all(|state, txs| {
            let d = unsafe { std::mem::transmute(state.docs[&doc.ref_].transact()) };
            txs.save_transaction(d)
        })
    }

    // TODO: optional origin
    fn y_doc_write_transaction(doc: YDoc, origin: Vec<u8>) -> WriteTransaction {
        with_mut_all(|state, txs| {
            let d = unsafe { std::mem::transmute(state.docs[&doc.ref_].transact_mut()) };
            txs.save_transaction_mut(d)
        })
    }

    fn y_doc_text(doc: YDoc, name: String) -> YText {
        with_mut(|state| {
            let d = &state.docs[&doc.ref_];
            state.save_text(d.get_or_insert_text(&name))
        })
    }

    fn y_doc_array(doc: YDoc, name: String) -> YArray {
        with_mut(|state| {
            let d = &state.docs[&doc.ref_];
            state.save_array(d.get_or_insert_array(&name))
        })
    }

    fn y_doc_map(doc: YDoc, name: String) -> YMap {
        with_mut(|state| {
            let d = &state.docs[&doc.ref_];
            state.save_map(d.get_or_insert_map(&name))
        })
    }

    fn y_doc_xml_fragment(doc: YDoc, _: String) -> YXmlFragment {
        todo!()
    }

    fn y_doc_xml_element(doc: YDoc, _: String) -> YXmlElement {
        todo!()
    }

    fn y_doc_xml_text(doc: YDoc, _: String) -> YXmlText {
        todo!()
    }

    fn y_doc_on_update_v1(doc: YDoc, _: u32) {
        todo!()
    }

    fn subdocs(doc: YDoc, _: YTransaction) -> Vec<String> {
        todo!()
    }

    fn subdoc_guids(doc: YDoc, _: YTransaction) -> Vec<String> {
        todo!()
    }

    fn encode_state_vector(doc: YDoc) -> Vec<u8> {
        operation(doc, |doc| doc.transact().state_vector().encode_v1())
    }

    fn encode_state_as_update(doc: YDoc, vector: Option<Vec<u8>>) -> Result<Vec<u8>, String> {
        operation(doc, |doc| {
            let s = doc.transact();
            let mut encoder = EncoderV1::new();
            let sv = if let Some(vector) = vector {
                match StateVector::decode_v1(vector.to_vec().as_slice()) {
                    Ok(sv) => sv,
                    Err(e) => {
                        return Err(e.to_string());
                    }
                }
            } else {
                StateVector::default()
            };
            s.encode_diff(&sv, &mut encoder);
            let payload = encoder.to_vec();
            Ok(payload)
        })
    }

    fn encode_state_as_update_v2(doc: YDoc, _: Option<Vec<u8>>) -> Result<Vec<u8>, String> {
        todo!()
    }

    fn apply_update(doc: YDoc, diff: Vec<u8>, origin: Vec<u8>) -> Result<(), String> {
        operation(doc, |doc| {
            let mut txn = doc.transact_mut();
            let diff: Vec<u8> = diff.to_vec();
            let mut decoder = DecoderV1::from(diff.as_slice());
            match Update::decode(&mut decoder) {
                Ok(update) => Ok(txn.apply_update(update)),
                Err(e) => Err(e.to_string()),
            }
        })
    }

    fn apply_update_v2(doc: YDoc, _: Vec<u8>, _: Vec<u8>) -> Result<(), String> {
        todo!()
    }

    // TODO: delete
    fn transaction_is_readonly(_: YTransaction) -> bool {
        todo!()
    }

    fn transaction_is_writeable(_: YTransaction) -> bool {
        todo!()
    }

    fn transaction_origin(t: YTransaction) -> Option<Vec<u8>> {
        // TODO: Not mut
        with_txn_state(|state| match t {
            YTransaction::ReadTransaction(t) => None,
            YTransaction::WriteTransaction(t) => state.transactions_mut[&t.ref_]
                .origin()
                .map(|r| r.as_ref().to_vec()),
        })
    }

    fn transaction_commit(t: YTransaction) {
        with_txn_state(|state| match &t {
            YTransaction::ReadTransaction(t) => {}
            YTransaction::WriteTransaction(t) => {
                state.transactions_mut.get_mut(&t.ref_).unwrap().commit()
            }
        })
    }

    fn transaction_state_vector_v1(t: YTransaction) -> Vec<u8> {
        with_txn(t, |t| t.state_vector().encode_v1().to_vec())
    }

    fn transaction_diff_v1(t: YTransaction, vector: Option<Vec<u8>>) -> Result<Vec<u8>, String> {
        with_txn(t, |t| {
            let mut encoder = EncoderV1::new();
            let sv = if let Some(vector) = vector {
                match StateVector::decode_v1(vector.to_vec().as_slice()) {
                    Ok(sv) => sv,
                    Err(e) => {
                        return Err(e.to_string());
                    }
                }
            } else {
                StateVector::default()
            };
            t.encode_diff(&sv, &mut encoder);
            Ok(encoder.to_vec())
        })
    }

    fn transaction_diff_v2(_: YTransaction, _: Option<Vec<u8>>) -> Result<Vec<u8>, String> {
        todo!()
    }

    // TODO: apply v1

    fn transaction_apply_v2(_: YTransaction, _: Vec<u8>) -> Result<(), String> {
        todo!()
    }

    fn transaction_encode_update(t: YTransaction) -> Vec<u8> {
        match t {
            YTransaction::ReadTransaction(_) => vec![0u8, 0u8],
            YTransaction::WriteTransaction(txn) => {
                with_txn_state(|state| state.transactions_mut[&txn.ref_].encode_update_v1())
            }
        }
    }

    fn transaction_encode_update_v2(t: YTransaction) -> Vec<u8> {
        match t {
            YTransaction::ReadTransaction(_) => vec![0u8, 0u8],
            YTransaction::WriteTransaction(txn) => {
                with_txn_state(|state| state.transactions_mut[&txn.ref_].encode_update_v2())
            }
        }
    }

    fn y_text_new(init: Option<String>) -> YText {
        // TODO: implement prelim
        todo!()
    }

    fn y_text_prelim(text: YText) -> bool {
        // TODO: implement prelim
        false
    }

    // TODO: txn should be Option?
    fn y_text_length(text: YText, txn: ImplicitTransaction) -> u32 {
        with_mut_all(|state, txs| {
            let text = &state.texts[&text.ref_];
            let txn = YTransactionInner::from_transact(txn, text, txs);
            text.len(&txn) as u32
        })
    }

    fn y_text_to_string(text: YText, txn: ImplicitTransaction) -> String {
        with_mut_all(|state, txs| {
            let text = &state.texts[&text.ref_];
            let txn = YTransactionInner::from_transact(txn, text, txs);
            text.get_string(&txn)
        })
    }

    fn y_text_to_json(text: YText, txn: ImplicitTransaction) -> String {
        // TODO: use to_json
        Self::y_text_to_string(text, txn)
    }

    fn y_text_insert(
        text: YText,
        index: u32,
        chunk: String,
        attributes: Option<JsonObject>,
        txn: ImplicitTransaction,
    ) {
        // TODO: probably does not need mut
        with_mut_all(|state, txs| {
            let chunk = &chunk;
            let v = &state.texts[&text.ref_];
            let txn = YTransactionInner::from_transact_mut(txn, v, txs);
            if let Some(attrs) = attributes.map(parse_attrs) {
                v.insert_with_attributes(txn, index, chunk, attrs)
            } else {
                v.insert(txn, index, chunk)
            }
        })
    }

    fn y_text_insert_embed(
        text: YText,
        index: u32,
        // TODO: embed cloud be other y-value types
        embed: JsonValueItem,
        attributes: Option<JsonObject>,
        txn: ImplicitTransaction,
    ) {
        with_mut_all(|state, txs| {
            let embed = map_json_value_any(embed);
            let v = &state.texts[&text.ref_];
            let txn = YTransactionInner::from_transact_mut(txn, v, txs);
            if let Some(attrs) = attributes.map(parse_attrs) {
                v.insert_embed_with_attributes(txn, index, embed, attrs);
            } else {
                v.insert_embed(txn, index, embed);
            }
        })
    }

    fn y_text_format(
        text: YText,
        index: u32,
        length: u32,
        attributes: JsonObject,
        txn: ImplicitTransaction,
    ) {
        with_mut_all(|state, txs| {
            let v = &state.texts[&text.ref_];
            let txn = YTransactionInner::from_transact_mut(txn, v, txs);
            let attrs = parse_attrs(attributes);
            v.format(txn, index, length, attrs);
        })
    }

    fn y_text_push(
        text: YText,
        chunk: String,
        attributes: Option<JsonObject>,
        txn: ImplicitTransaction,
    ) {
        with_mut_all(|state, txs| {
            let chunk = &chunk;
            let v = &state.texts[&text.ref_];
            let txn = YTransactionInner::from_transact_mut(txn, v, txs);
            if let Some(attrs) = attributes.map(parse_attrs) {
                let index = v.len(txn);
                v.insert_with_attributes(txn, index, chunk, attrs)
            } else {
                v.push(txn, chunk)
            }
        })
    }

    fn y_text_delete(text: YText, index: u32, length: u32, txn: ImplicitTransaction) {
        with_mut_all(|state, txs| {
            let v = &state.texts[&text.ref_];
            let txn = YTransactionInner::from_transact_mut(txn, v, txs);
            v.remove_range(txn, index, length);
        })
    }

    // TODO: snapshot

    fn y_text_observe(text: YText, _: u32) {
        todo!()
    }

    fn y_text_observe_deep(text: YText, _: u32) {
        todo!()
    }

    fn y_array_new(_: Option<JsonArray>) -> YArray {
        // TODO: implement prelim
        todo!()
    }

    fn y_array_prelim(array: YArray) -> bool {
        // TODO: implement prelim
        false
    }

    fn y_array_length(array: YArray, txn: ImplicitTransaction) -> u32 {
        with_mut_all(|state, txs| {
            let v = &state.arrays[&array.ref_];
            let txn = YTransactionInner::from_transact(txn, v, txs);
            v.len(&txn)
        })
    }

    fn y_array_to_json(array: YArray, txn: ImplicitTransaction) -> JsonValueItem {
        with_mut_all(|state, txs| {
            let v = &state.arrays[&array.ref_];
            let txn = YTransactionInner::from_transact(txn, v, txs);
            map_any_json_value(v.to_json(&txn))
        })
    }

    fn y_array_insert(array: YArray, index: u32, items: JsonArray, txn: ImplicitTransaction) {
        with_mut_all(|state, txs| {
            let v = &state.arrays[&array.ref_];
            let txn = YTransactionInner::from_transact_mut(txn, v, txs);
            let items = match map_json_value_any(items) {
                Any::Array(items) => items,
                _ => panic!("expected array"),
            };
            insert_at(v, txn, index, items);
        })
    }

    fn y_array_push(array: YArray, items: JsonArray, txn: ImplicitTransaction) {
        with_mut_all(|state, txs: &mut TxnState| {
            let v = &state.arrays[&array.ref_];
            let txn = YTransactionInner::from_transact_mut(txn, v, txs);
            let index = v.len(txn);
            let items = match map_json_value_any(items) {
                Any::Array(items) => items,
                _ => panic!("expected array"),
            };
            insert_at(v, txn, index, items);
        })
    }

    fn y_array_delete(array: YArray, index: u32, length: u32, txn: ImplicitTransaction) {
        with_mut_all(|state, txs| {
            let v = &state.arrays[&array.ref_];
            let txn = YTransactionInner::from_transact_mut(txn, v, txs);
            v.remove_range(txn, index, length);
        })
    }

    fn y_array_move_content(array: YArray, source: u32, target: u32, txn: ImplicitTransaction) {
        with_mut_all(|state, txs| {
            let v = &state.arrays[&array.ref_];
            let txn = YTransactionInner::from_transact_mut(txn, v, txs);
            v.move_to(txn, source, target)
        })
    }

    fn y_array_get(array: YArray, index: u32, txn: ImplicitTransaction) -> Result<YValue, String> {
        with_mut_all(|state, txs| {
            let v = &state.arrays[&array.ref_];
            let txn = YTransactionInner::from_transact(txn, v, txs);
            if let Some(value) = v.get(&txn, index) {
                Ok(map_y_value(value))
            } else {
                Err("Index outside the bounds of an YArray".to_string())
            }
        })
    }

    fn y_array_observe(array: YArray, _: u32) {
        todo!()
    }

    fn y_array_observe_deep(array: YArray, _: u32) {
        todo!()
    }

    fn y_map_new(_: Option<JsonObject>) -> YMap {
        todo!()
    }

    fn y_map_prelim(map: YMap) -> bool {
        todo!()
    }

    fn y_map_length(map: YMap, txn: ImplicitTransaction) -> u32 {
        with_mut_all(|state, txs| {
            let v = &state.maps[&map.ref_];
            let txn = YTransactionInner::from_transact(txn, v, txs);
            v.len(&txn)
        })
    }

    fn y_map_to_json(map: YMap, txn: ImplicitTransaction) -> JsonValueItem {
        with_mut_all(|state, txs| {
            let v = &state.maps[&map.ref_];
            let txn = YTransactionInner::from_transact(txn, v, txs);
            map_any_json_value(v.to_json(&txn))
        })
    }

    fn y_map_set(map: YMap, key: String, value: JsonValueItem, txn: ImplicitTransaction) {
        with_mut_all(|state, txs| {
            let v = &state.maps[&map.ref_];
            let txn = YTransactionInner::from_transact_mut(txn, v, txs);
            // TODO: y_value
            v.insert(txn, key, map_json_value_any(value));
        })
    }

    fn y_map_delete(map: YMap, key: String, txn: ImplicitTransaction) {
        with_mut_all(|state, txs| {
            let v = &state.maps[&map.ref_];
            let txn = YTransactionInner::from_transact_mut(txn, v, txs);
            v.remove(txn, &key);
        })
    }

    fn y_map_get(map: YMap, key: String, txn: ImplicitTransaction) -> Option<YValue> {
        with_mut_all(|state, txs| {
            let v = &state.maps[&map.ref_];
            let txn = YTransactionInner::from_transact(txn, v, txs);
            v.get(&txn, &key).map(map_y_value)
        })
    }

    // TODO: entries and keys

    fn y_map_observe(map: YMap, _: u32) {
        todo!()
    }

    fn y_map_observe_deep(map: YMap, _: u32) {
        todo!()
    }

    fn y_xml_element_name(_: YXmlElement) -> Option<String> {
        todo!()
    }

    fn y_xml_element_length(_: YXmlElement, txn: ImplicitTransaction) -> u32 {
        todo!()
    }

    fn y_xml_element_insert_xml_element(
        _: YXmlElement,
        _: u32,
        _: String,
        txn: ImplicitTransaction,
    ) -> YXmlElement {
        todo!()
    }

    fn y_xml_element_insert_xml_text(_: YXmlElement, _: u32, txn: ImplicitTransaction) -> YXmlText {
        todo!()
    }

    fn y_xml_element_delete(_: YXmlElement, _: u32, _: u32, txn: ImplicitTransaction) {
        todo!()
    }

    fn y_xml_fragment_name(_: YXmlFragment) -> Option<String> {
        todo!()
    }

    fn y_xml_fragment_length(_: YXmlFragment, txn: ImplicitTransaction) -> u32 {
        todo!()
    }

    fn y_xml_text_length(_: YXmlText, txn: ImplicitTransaction) -> u32 {
        todo!()
    }
}

fn parse_attrs(attributes: JsonObject) -> HashMap<Arc<str>, Any> {
    match map_json_value_any(attributes) {
        Any::Map(m) => m.into_iter().map(|(k, v)| (k.into(), v)).collect(),
        _ => panic!("Expected a map"),
    }
}

fn map_y_value(v: Value) -> YValue {
    match v {
        Value::Any(a) => YValue::JsonValueItem(map_any_json_value(a)),
        Value::YText(a) => YValue::YText(with_mut(|state| state.save_text(a))),
        Value::YArray(a) => YValue::YArray(with_mut(|state| state.save_array(a))),
        Value::YMap(a) => YValue::YMap(with_mut(|state| state.save_map(a))),
        Value::YXmlElement(a) => YValue::YXmlElement(with_mut(|state| state.save_xml_element(a))),
        Value::YXmlFragment(a) => {
            YValue::YXmlFragment(with_mut(|state| state.save_xml_fragment(a)))
        }
        Value::YXmlText(a) => YValue::YXmlText(with_mut(|state| state.save_xml_text(a))),
        Value::YDoc(a) => YValue::YDoc(with_mut(|state| state.save_doc(a))),
    }
}

fn map_value(v: YValue) -> Value {
    match v {
        YValue::JsonValueItem(a) => Value::Any(map_json_value_any(a)),
        YValue::YText(a) => Value::YText(with_mut(|state| state.texts[&a.ref_].clone())),
        YValue::YArray(a) => Value::YArray(with_mut(|state| state.arrays[&a.ref_].clone())),
        YValue::YMap(a) => Value::YMap(with_mut(|state| state.maps[&a.ref_].clone())),
        YValue::YXmlElement(a) => {
            Value::YXmlElement(with_mut(|state| state.xml_elements[&a.ref_].clone()))
        }
        YValue::YXmlFragment(a) => {
            Value::YXmlFragment(with_mut(|state| state.xml_fragments[&a.ref_].clone()))
        }
        YValue::YXmlText(a) => Value::YXmlText(with_mut(|state| state.xml_texts[&a.ref_].clone())),
        YValue::YDoc(a) => Value::YDoc(with_mut(|state| state.docs[&a.ref_].clone())),
    }
}

fn map_json_value_any(v: JsonValueItem) -> Any {
    map_json_value_any_v(&v.item, &v)
}

// TODO: don't clone, take ownership of item
fn map_json_value_any_v(item: &JsonValue, references: &JsonValueItem) -> Any {
    let map_ref = |a: &JsonValue| -> Any { map_json_value_any_v(a, references) };
    match item {
        JsonValue::Str(s) => Any::String(s.clone().into()),
        JsonValue::Number(n) => Any::Number(*n),
        JsonValue::Undefined => Any::Undefined,
        JsonValue::BigInt(n) => Any::BigInt(*n),
        JsonValue::Boolean(b) => Any::Bool(*b),
        JsonValue::Null => Any::Null,
        JsonValue::Buffer(v) => Any::Buffer(v.clone().into()),
        JsonValue::Array(a) => Any::Array(
            references.array_references[a.index as usize]
                .iter()
                .map(map_ref)
                .collect(),
        ),
        JsonValue::Map(o) => Any::Map(Box::new(HashMap::from_iter(
            references.map_references[o.index as usize]
                .iter()
                .map(|(k, v)| (k.clone(), map_ref(&v))),
        ))),
    }
}

fn map_any_json_value(v: Any) -> JsonValueItem {
    let mut references = JsonValueItem {
        item: JsonValue::Undefined,
        map_references: vec![],
        array_references: vec![],
    };
    let item = map_any_json_value_ref(v, &mut references);
    references.item = item;
    references
}

fn map_any_json_value_ref(v: Any, references: &mut JsonValueItem) -> JsonValue {
    match v {
        Any::String(s) => JsonValue::Str(s.to_string()),
        Any::Number(n) => JsonValue::Number(n),
        Any::Undefined => JsonValue::Undefined,
        Any::BigInt(n) => JsonValue::BigInt(n),
        Any::Bool(b) => JsonValue::Boolean(b),
        Any::Null => JsonValue::Null,
        Any::Buffer(v) => JsonValue::Buffer(v.to_vec()),
        Any::Array(a) => {
            let m = Vec::from(a)
                .into_iter()
                .map(|v| map_any_json_value_ref(v, references))
                .collect();
            let index = references.array_references.len() as u32;
            references.array_references.push(m);

            JsonValue::Array(JsonArrayRef { index })
        }
        Any::Map(o) => {
            let m = o
                .into_iter()
                .map(|(k, v)| (k, map_any_json_value_ref(v, references)))
                .collect();
            let index = references.map_references.len() as u32;
            references.map_references.push(m);

            JsonValue::Map(JsonMapRef { index })
        }
    }
}

fn insert_at(dst: &ArrayRef, txn: &mut TransactionMut, index: u32, src: Box<[Any]>) {
    dst.insert_range(txn, index, src.into_vec());
    // TODO: support references as src inputs
    // let mut j = index;
    // let mut i = 0;
    // while i < src.len() {
    //     let mut anys = Vec::default();
    //     while i < src.len() {
    //         let js = &src[i];
    //         if let Some(any) = js_into_any(js) {
    //             anys.push(any);
    //             i += 1;
    //         } else {
    //             break;
    //         }
    //     }

    //     if !anys.is_empty() {
    //         let len = anys.len() as u32;
    //         dst.insert_range(txn, j, anys);
    //         j += len;
    //     } else {
    //         let js = &src[i];
    //         let wrapper = JsValueWrapper(js.clone());
    //         dst.insert(txn, j, wrapper);
    //         i += 1;
    //         j += 1;
    //     }
    // }
}
