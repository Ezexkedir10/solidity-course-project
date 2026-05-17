// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {

    constructor() payable {
        require(msg.value >= 1 ether, "Must send at least 1 ether");
    }
}