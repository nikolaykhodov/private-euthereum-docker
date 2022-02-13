## Overview

It is a zero-config Ethereum (Proof-of-Authority) setup with three nodes.


## Features

It just works: no need to configure or build anything. Run:

```
docker compose up
```

## Code structure

### API & Networking

- An RPC server of the 2nd node is available at http://localhost:8545 
- No any other service is exposed

### Genesis

Three wallets:

- `c52c86c964f1afe1bbd6bf65787f4ef8105f2b6d` (`node1`)
- `41cec578f54bdd7d67d5f8cac81f537553164e5c` (`node2`)
- `0xdc6217bea0c0dc41ebba2dffabe6f4f4324a4965` (`node3`)

have initial balances and authorities. 

### Nodes

There are 3 nodes with fixed nodekeys. Peers are announced via `static-nodes.json`. 

## Some commands used for development

```bash
geth --datadir node1/ account new
geth --datadir node1/ init src/genesis.json
bootnode -genkey bootnode.key
```

## License

This project is licensed under [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/)
