# Yellow Submarine bridge-contracts

## Introduction
1. This bridge has the following cross-chain functions: it supports cross chain between erc20、 erc721 and erc1155, supports platform currency to erc20, and supports cross chain contract call. 
2. This is the contract part of the bridge, and the other part is relayer(https://github.com/ysfinance/bridge-relayer)

## Contract Architecture
1. The contracts mainly include manager, bridge and handler contracts, which are deployed on the findora master chain and other EVM slave chains respectively. 
2. Users perform cross-chain operations through handler contracts. 
3. The bridge contract cooperates with the handler contract to complete the business logic processing when crossing the chain, and cooperates with the handler on the target chain to complete the relevant operations of the target chain. 
4. The manager contract is responsible for signing cross chain data, ensuring data reliability, and some configuration management.

## Deployment
Reference [**how to deploy**](./docs/deploy.md)

## Relayer
1. After the contract is deployed, the relayer is required to complete the whole cross chain operation.
2. The relayer is responsible for monitoring the cross chain events generated by the bridge contract and voting the cross chain data in the manager contract.
3. After a successful vote, the manager will generate a vote event.
4. The relayer listens to the voting success event, and then calls the bridge to complete the subsequent operations on the target chain.

## Usage
1. Cross-chain contract call,  Call the callremote method of the bridge contract directly.
2. Call the deposit method of the handler corresponding to the resourceID when cross chain between erc20、 erc721 and erc1155, platform currency to erc20.

## Hardhat
Hardhat is an Ethereum development environment for professionals. Here are some hardhat commands, Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```

