#!/bin/bash

# Setup
BUILD_PROFILE=${1:-release} # dev, other Cargo.toml profile or release (default)
BUILD_DIR=platform-build
mkdir $BUILD_DIR
cd $BUILD_DIR

# Create the jniLibs build directory
JNI_DIR=jniLibs
mkdir -p $JNI_DIR

# Set up cargo-ndk
cargo install cargo-ndk
rustup target add \
        aarch64-linux-android \
        armv7-linux-androideabi \
        x86_64-linux-android \
        i686-linux-android \
        wasm32-wasi

# Build the android libraries in the jniLibs directory
cargo ndk -o $JNI_DIR \
        --manifest-path ../Cargo.toml \
        -t armeabi-v7a \
        -t arm64-v8a \
        -t x86 \
        -t x86_64 \
        build --profile $BUILD_PROFILE 

if [[ $WASM_BUILD_RUST_WASI_EXAMPLE != false ]]
then
        cargo build --target wasm32-wasi --profile $BUILD_PROFILE \
                --manifest-path ../packages/rust_wasi_example/Cargo.toml
fi

# Archive the dynamic libs
cd $JNI_DIR
tar -czvf ../android.tar.gz *
cd -

# Cleanup
rm -rf $JNI_DIR
