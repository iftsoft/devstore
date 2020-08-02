#!/bin/bash

pushd "$(dirname "$0")" > /dev/null || exit

mkdir -p build
mkdir -p build/linux
mkdir -p build/darwin
mkdir -p build/windows

echo "Build project ./client/"
cd client || exit
go mod tidy
GOOS=linux GOARCH=amd64 go build -o ../build/linux/client .
GOOS=darwin GOARCH=amd64 go build -o ../build/darwin/client .
GOOS=windows GOARCH=amd64 go build -o ../build/windows/client.exe .
cd ..

echo "Build project ./server/"
cd server || exit
go mod tidy
GOOS=linux GOARCH=amd64 go build -o ../build/linux/server .
GOOS=darwin GOARCH=amd64 go build -o ../build/darwin/server .
GOOS=windows GOARCH=amd64 go build -o ../build/windows/server.exe .
cd ..

echo "Build project ./cashvalidator/"
cd cashvalidator || exit
go mod tidy
GOOS=linux GOARCH=amd64 go build -o ../build/linux/cashvalidator .
GOOS=darwin GOARCH=amd64 go build -o ../build/darwin/cashvalidator .
GOOS=windows GOARCH=amd64 go build -o ../build/windows/cashvalidator.exe .
cd ..

popd > /dev/null || exit
