pragma solidity ^0.8.20;

interface IHero {
    function alert(uint256 enemies, bool armed) external;
}

contract Sidekick {

    function sendAlert(address hero, uint256 enemies, bool armed) public {
        bytes memory payload =
            abi.encodeWithSignature("alert(uint256,bool)", enemies, armed);

        (bool success, ) = hero.call(payload);
        require(success);
    }
}