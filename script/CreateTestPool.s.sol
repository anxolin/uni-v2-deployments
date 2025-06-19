// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {IUniswapV2Factory} from "../src/UniswapV2Factory.sol";
import {BasicERC20} from "../src/BasicERC20.sol";

contract UniswapV2FactoryScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        // Read factory address from environment variable
        address factoryAddress = vm.envAddress("UNIV2_FACTORY_ADDRESS");
        address minter = vm.envAddress("MINTER");

        console.log("factoryAddress:", factoryAddress);
        console.log("minter for tokens:", minter);

        BasicERC20 milk = new BasicERC20("Milk", "MLK", minter);
        console.log("MILK token created:", address(milk));

        BasicERC20 yogurt = new BasicERC20("Yogurt", "YGT", minter);
        console.log("YOGURT token created:", address(yogurt));

        // Create pair
        IUniswapV2Factory uniswapV2Factory = IUniswapV2Factory(factoryAddress);
        address pair = uniswapV2Factory.createPair(address(milk), address(yogurt));
        console.log("Pair created:", pair);

        // Mint tokens
        milk.mint(minter, 1000000000000000000000000); // 1M
        yogurt.mint(minter, 1000000000000000000000000); // 1M

        vm.stopBroadcast();
    }
}
