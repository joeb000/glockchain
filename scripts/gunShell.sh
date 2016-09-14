#!/bin/bash
CONTRACT_ADDRESS="0xd000ff69ff380e19762db5f92a5ce57f06f6ae83"


ADDRESS="0x7f06be1175ff03ccaaecf21bb59ca3fbdf84bcd1"

echo $1
if [ $1 == "shot" ]; then
  echo "GUN SHOT"
  curl -X POST --data '{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{"from": "'"$ADDRESS"'","to": "'"$CONTRACT_ADDRESS"'",  "gas": "0x7a120", "data":"0xcea73ef0000000000000000000000000f7caaeb6aa9a57774d41c765631c84c28b7aa588000000000000000000000000000000000000000000000000000000000240991300000000000000000000000000000000000000000000000000000000074b8419"}],"id":8}' http://localhost:8545
elif [ $1 == "drawn" ]; then
  #statementsxs
  echo "GUN DRAWN"
  curl -X POST --data '{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{"from": "'"$ADDRESS"'","to": "'"$CONTRACT_ADDRESS"'",  "gas": "0x7a120", "data":"0x964be65c000000000000000000000000f7caaeb6aa9a57774d41c765631c84c28b7aa588000000000000000000000000000000000000000000000000000000000240991300000000000000000000000000000000000000000000000000000000074b8419"}],"id":8}' http://localhost:8545

elif [ $1 == "holster" ]; then
  #statements
  echo "GUN HOLSTERED"
  curl -X POST --data '{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{"from": "'"$ADDRESS"'","to": "'"$CONTRACT_ADDRESS"'",  "gas": "0x7a120", "data":"0xc13b061b"}],"id":8}' http://localhost:8545

fi
