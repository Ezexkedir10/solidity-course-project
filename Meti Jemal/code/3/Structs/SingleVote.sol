pragma solidity ^0.8.20;

contract Contract {

    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    mapping(address => bool) public hasVoted;

    function createVote(Choices _choice) external {
        require(!hasVoted[msg.sender], "Already voted");

        votes.push(Vote(_choice, msg.sender));
        hasVoted[msg.sender] = true;
    }
}