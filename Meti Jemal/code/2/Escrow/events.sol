// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {

    address public arbiter;
    address public beneficiary;

    event Approved(uint balance);

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }

    function approve() external {
        require(msg.sender == arbiter, "Not arbiter");

        uint bal = address(this).balance;

        emit Approved(bal);

        payable(beneficiary).transfer(bal);
    }
}