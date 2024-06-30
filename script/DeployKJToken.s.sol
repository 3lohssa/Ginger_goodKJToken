// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/KJToken.sol";

import {Script} from "forge-std/Script.sol";
import {KJToken} from "../src/KJToken.sol";

contract DeployKJToken is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        address initialAccount = vm.envAddress("INITIAL_ACCOUNT");
        uint256 initialSupply = vm.envUint("INITIAL_SUPPLY");

        KJToken kjToken = new KJToken(initialSupply, initialAccount);

        console.log("KJToken deployed at:", address(kjToken));

        vm.stopBroadcast();
    }
}
