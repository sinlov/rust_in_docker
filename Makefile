.PHONY: test check clean build dist all

# change test case group
INFO_TEST_FILTER_GROUP := grammar

INFO_CATCHE_BUILD ?= ./target


INFO_DOCKER_RUST_TAG := 1.36.0
INFO_DOCKER_RUST_NAME ?= rust
INFO_DOCKER_CONTAINER_NAME ?= rust-hello

help:
	@echo "-> this is project of rust base"
	@echo " just use rust framework and CLI rustc, cargo"
	@echo " you can use task below"
	@echo ""
	@echo "make cleanAll ~> clean all build ./"
	@echo "make run ~> run env TEST_FILTER=$(INFO_TEST_FILTER_GROUP) ./"
	@echo "make runDocker ~> run env TEST_FILTER=$(INFO_TEST_FILTER_GROUP) use docker $(INFO_DOCKER_RUST_NAME):$(INFO_DOCKER_RUST_TAG)"
	@echo ""
	@echo "Warning! only support make run and cleanAll this used Makefile template generation"

cleanBuild:
	if [ -d $(INFO_CATCHE_BUILD) ]; then rm -rf $(INFO_CATCHE_BUILD); else echo "~> cleanBuild finish"; fi

cleanAll: cleanBuild
	@echo "clean finish"

checkCargo:
	@echo "=> If check env [ cargo ] error please install at https://www.rust-lang.org/tools/install"
	@cargo version

run: checkCargo
	env TEST_FILTER=$(INFO_TEST_FILTER_GROUP) cargo run

runDocker:
	docker version
	docker run --rm --env TEST_FILTER=$(INFO_TEST_FILTER_GROUP) --name $(INFO_DOCKER_CONTAINER_NAME) --user "$$(id -u)":"$$(id -g)" -v "$$PWD":/usr/src/myapp -w /usr/src/myapp $(INFO_DOCKER_RUST_NAME):$(INFO_DOCKER_RUST_TAG) cargo run