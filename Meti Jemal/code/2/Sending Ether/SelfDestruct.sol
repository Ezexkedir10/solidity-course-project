// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {

address public charity;

constructor(address _charity) {
charity = _charity;
}

// Contract can receive ETH
receive() external payable {}

// Donate + destroy contract
function donate() public {
selfdestruct(payable(charity));
}
}