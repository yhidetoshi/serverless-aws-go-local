.PHONY: build clean deploy deploy-local

build:
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/main ./main.go

clean:
	rm -rf ./bin

deploy-local: build
	@sls offline

deploy: clean build
	sls deploy --verbose
