// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {

    address public owner;

    constructor() payable {
        owner = msg.sender;
    }

    function withdraw() public {
        require(msg.sender == owner, "Not owner");
        payable(owner).transfer(address(this).balance);
    }
}