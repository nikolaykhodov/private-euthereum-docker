#!/bin/sh

NODE_ID=$1
IP_ADDRESS=$2

if [ ! -d "/root/${NODE_ID}/geth" ]
then
  echo "Seeding the genesis..."
  geth --datadir /root/${NODE_ID}/ init /root/src/genesis.json
fi

cp /root/src/static-nodes.json /root/${NODE_ID}/static-nodes.json
cp /root/src/${NODE_ID}/nodekey /root/${NODE_ID}/geth/nodekey

geth \
  --nodiscover \
  --datadir /root/${NODE_ID} \
  --networkid 1122 \
  --syncmode full \
  --port 30303 \
  --gcmode archive \
  --nat extip:${IP_ADDRESS} \
  --mine \
  --miner.gasprice 0 \
  --http \
  --http.api 'admin,eth,net,web3' \
  --http.vhosts '*' \
  --http.port 8545 \
  --http.addr 0.0.0.0 \
  --http.corsdomain '*' \
  --ws \
  --ws.addr 0.0.0.0 \
  --ws.port 8546 \
  --ws.origins '*' \
  --graphql \
  --graphql.corsdomain '*' \
  --ipcpath /root/node1/ipc \
  --keystore /root/src/${NODE_ID}/ \
  --unlock $(cat /root/src/${NODE_ID}/public_key) \
  --password /root/src/private_key \
  --allow-insecure-unlock \
  --verbosity 5