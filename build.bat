
mkdir build 2> NUL
mkdir build\windows 2> NUL

set GOARCH=amd64
set GOOS=windows

go mod tidy

cd client
go build -o ..\build\windows\client.exe .
copy client.yml ..\build\windows\client.yml
cd ..

cd server
go build -o ..\build\windows\server.exe .
copy server.yml ..\build\windows\server.yml
cd ..

cd cashvalidator
go build -o ..\build\windows\cashvalidator.exe .
copy cashvalidator.yml ..\build\windows\cashvalidator.yml
cd ..
