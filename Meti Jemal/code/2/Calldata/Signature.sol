// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IHero {
    function alert() external;
}

contract Sidekick {

    function sendAlert(address hero) public {
        bytes4 selector = bytes4(keccak256("alert()"));

        (bool success, ) = hero.call(abi.encodeWithSelector(selector));
        require(success);
    }
}