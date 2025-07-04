## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage


### Build

```shell
forge build
```

### Test

```shell
forge test
```

### Format

```shell
forge fmt
```

### Gas Snapshots

```shell
forge snapshot
```

### Anvil

```shell
anvil
```

### Deploy

```shell
# Deploy UniswapV2Factory. After the dry-run, you can add:
#  --broadcast                                      to deploy the contract
#  --verify --etherscan-api-key <api-key>           to verify the contract on etherscan
forge script script/UniswapV2Factory.s.sol:UniswapV2FactoryScript --rpc-url $RPC_URL --private-key $PRIVATE_KEY

# Deploy Test Pool
#  --broadcast                                      to deploy the contract
#  --verify --etherscan-api-key <api-key>           to verify the contract on etherscan
UNIV2_FACTORY_ADDRESS=<uniswap-v2> \
MINTER=<minter-address> \
forge script script/CreateTestPool.s.sol:UniswapV2FactoryScript \
  --rpc-url $RPC_URL \
  --private-key $PRIVATE_KEY
```


### Generate networks.json
After deployment of a new contract, make sure to run this script to update the `networks.json` file.

```shell
./dev/generate-networks-file.sh
```

## WIP: deploy with zkSync (in lens)

To work with zkSync, you need to import the private key and change the default profile:

```shell
# Build the contracts
FOUNDRY_PROFILE=zksync forge build --zksync

# Deploy the contracts
FOUNDRY_PROFILE=zksync forge script script/UniswapV2Factory.s.sol:UniswapV2FactoryScript --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY

# 🔥 This FAILS (both using compatibility mode and not)
# https://explorer.lens.xyz/tx/0x5e565b9989936a16961a6c03a93cfaf7526dbbc5624260a919f61dadfa8e6f8f
```


### Cast

```shell
cast <subcommand>
```

### Help

```shell
forge --help
anvil --help
cast --help
```
