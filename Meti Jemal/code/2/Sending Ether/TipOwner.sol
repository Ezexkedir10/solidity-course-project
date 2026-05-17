// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Receive Ether
    receive() external payable {}

    // Tip the owner
    function tip() public payable {
        payable(owner).transfer(msg.value);
    }
}