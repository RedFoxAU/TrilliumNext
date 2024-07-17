#!/usr/bin/env bash
ELECTRON_VERSION="electron-v125"
NODE_VERSION="node-v115"
BETTER_SQLITE3_VERSION=11.1.2

function download() {
    version="$1"
    platform="$2"
    dest_name="$3"
    url=https://github.com/WiseLibs/better-sqlite3/releases/download/v${BETTER_SQLITE3_VERSION}/better-sqlite3-v${BETTER_SQLITE3_VERSION}-${version}-${platform}.tar.gz
    temp_file="temp.tar.gz"
    curl -L "$url" -o "$temp_file"
    tar -xzvf "$temp_file"
    mv build/Release/better_sqlite3.node "$dest_name-better_sqlite3.node"
    rm -rf build
    rm -f "$temp_file"
}

script_dir=$(realpath $(dirname $0))
cd "$script_dir"

download $NODE_VERSION "linux-x64" "linux-server"
download $ELECTRON_VERSION "linux-x64" "linux-desktop"
download $ELECTRON_VERSION "win32-x64" "win"
download $ELECTRON_VERSION "darwin-x64" "mac-x64"
download $ELECTRON_VERSION "darwin-arm64" "mac-arm64"