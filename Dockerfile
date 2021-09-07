FROM paritytech/ci-linux:production

WORKDIR /usr/src/app

COPY . /usr/src/app/
# remove cache file and build node
RUN cargo build --release

ENTRYPOINT [ "./target/release/canvas" ]

CMD ["--dev", "--tmp", "--ws-external", "--no-telemetry", "--rpc-external", "--rpc-methods=Unsafe", "--rpc-cors=all"]
