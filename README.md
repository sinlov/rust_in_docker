# this is rust code use docker build demo

## how to use

> must let your docker environment can use!

```sh
# clone code
git clone https://github.com/sinlov/rust_in_docker.git
# into project path

cd rust_in_docker


# see help
make help
# run use docker
make runDocker
# clean build
make cleanAll
```

## in local mode

If you do not have Rust setup, please visit [rust-lang.org](https://www.rust-lang.org/) for operating specific instructions.
In order to run the test case you need Rust installed. To check your installations simply type:

```
$ rustc --version
$ cargo --version
```

Currently, a Rust version of 1.3.0 or higher

can run this project version is

- rustc 1.36.0
- cargo 1.36.0

run local use as

```sh
make run
```

## when build error ?

```sh
# use CLI to clean build
make cleanAll
```

## how windows build this project?

install rust with rustup-init.exe in https://www.rust-lang.org/tools/install open with Windows!

```bash
cargo run
# if error use
rd /s /Q .\target
del .\src\path_to_grammar.rs
```
