// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {

    address public charity;

    constructor(address _charity) {
        charity = _charity;
    }

    // 🔥 This is REQUIRED so contract can receive ETH
    receive() external payable {}

    // Donate all contract balance to charity
    function donate() public {
        payable(charity).transfer(address(this).balance);
    }
}