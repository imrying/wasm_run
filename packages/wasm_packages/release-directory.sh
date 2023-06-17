#!/bin/bash

SCRIPT_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
cd $SCRIPT_DIR # Go to the wasm_parser package directory

rm -rf release_files/
mkdir release_files

cp wasm_parser/lib/wasm_parser_wasm.wasm release_files/
cp wasm_parser/lib/wasm_parser_wasm.threads.wasm release_files/
cp wasm_parser/wasm_parser_wasm/wit/wasm-parser.wit release_files/

cp compression_rs/lib/compression_rs_wasm.wasm release_files/
cp compression_rs/lib/compression_rs_wasm.threads.wasm release_files/
cp compression_rs/compression_rs_wasm/wit/compression-rs.wit release_files/

cp rust_crypto/lib/rust_crypto_wasm.wasm release_files/
cp rust_crypto/rust_crypto_wasm/wit//rust-crypto.wit release_files/

cp image_rs/lib/image_rs_wasm.wasm release_files/
cp image_rs/image_rs_wasm/wit//image-rs.wit release_files/
