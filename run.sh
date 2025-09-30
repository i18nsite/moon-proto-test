#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

if [ ! -d "protoc-gen-mbt" ]; then
git clone --depth=1 git@github.com:moonbitlang/protoc-gen-mbt.git
cd protoc-gen-mbt
moon build -C cli
cd ..
fi

mkdir -p api

protoc \
  --plugin=protoc-gen-mbt=$DIR/protoc-gen-mbt/cli/target/native/release/build/protoc-gen-mbt.exe \
  --mbt_out=. \
  --mbt_opt=paths=source_relative,project_name=api \
  data.proto

  # --proto_path ../tran/srv/api/proto \
  #  data.proto

cd api
moon update
moon build --target js
# moon build --target wasm
