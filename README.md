## About

Run a Jito-Solana Validator for local testing.

## Setup

```bash
docker build --platform linux/amd64 -t jito-solana-test .
```

Push to DockerHub
```
docker tag jito-solana-test chrisaspheron/jito-solana-test:latest
docker push chrisaspheron/jito-solana-test:latest
```

Local MacOS build
```
docker build --platform linux/arm64 --progress=plain -t jito-solana-test .
```

Local Build(With Debug enabled and cache off)
```
docker build --platform linux/arm64 --progress=plain --no-cache -t jito-solana-test .
```

## Run

Run locally:
```
docker run -p 127.0.0.1:8899:8899 jito-solana-test 
```