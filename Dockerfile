FROM rust:1.67

# Create app directory
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang cmake make libprotobuf-dev protobuf-compiler

ARG TAG="v1.16.17-jito"

RUN export TAG=v1.16.17-jito

RUN git clone https://github.com/jito-foundation/jito-solana.git --recurse-submodules  \
    && cd jito-solana  \
    && git checkout tags/$TAG \
    && git submodule update --init --recursive

WORKDIR /usr/src/app/jito-solana

RUN ls -latr  \
    && pwd

EXPOSE 8899

ENTRYPOINT ["/bin/bash", "-c", "./start", ">", "faucet.log", "./bootstrap", ">", "validator.log"]