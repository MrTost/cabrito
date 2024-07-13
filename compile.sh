#!/bin/zsh

echo 'Compiling Frontend'
cd frontend || exit 1
npm install
npm run build

cd ../backend || exit 1

cp config.json ../.bin

echo 'Compiling binary for MacOS Intel 64'
GOOS=darwin GOARCH=amd64 go build -o ../.bin/cabrito-server-macos-intel ./main.go

echo 'Compiling binary for Linux Intel 64'
GOOS=linux GOARCH=amd64 go build -o ../.bin/cabrito-server-linux-intel ./main.go

echo 'Compiling binary for Windows 64'
GOOS=windows GOARCH=amd64 go build -o ../.bin/cabrito-server-win64.exe ./main.go