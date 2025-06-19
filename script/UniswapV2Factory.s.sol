// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {UniswapV2Factory} from "../src/UniswapV2Factory.sol";

contract UniswapV2FactoryScript is Script {
    UniswapV2Factory public uniswapV2Factory;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        uniswapV2Factory = new UniswapV2Factory(address(0));

        vm.stopBroadcast();
    }
}
