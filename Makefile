.PHONY: test osv-scan lint

all: clean osv-scan lint test build

test: lint
	@echo "======== Test ========"
	@go test -cover -race -v ./...

osv-scan:
	@echo "======== OSV SCANNER ========"
	@osv-scanner -r .

lint:
	@echo "======== GOLANGCI-LINT ========"
	@golangci-lint run