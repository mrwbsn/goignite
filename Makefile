APP=goignite
APPDIR=cmd/${APP}

all: install test build
build: clean
	go build -o ${APP} ${APPDIR}/main.go
clean:
	rm -rf ${APP}
run:
	go run -race ${APPDIR}/main.go
test:
	go test -v -race -covermode=atomic -coverprofile=coverage.out ./...
install:
	go build ./...

.PHONY: build clean run test install
