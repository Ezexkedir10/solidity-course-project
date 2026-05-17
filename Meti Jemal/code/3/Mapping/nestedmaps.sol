pragma solidity ^0.8.20;

contract Contract {

    enum ConnectionTypes {
        Unacquainted,
        Friend,
        Blocked,
        Family
    }

    mapping(address => mapping(address => ConnectionTypes)) public connections;

    function connectWith(address user, ConnectionTypes _type) external {
        connections[msg.sender][user] = _type;
    }
}