pragma solidity ^0.8.20;

contract Contract {

    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    mapping(address => bool) public hasVoted;

    // Create vote (only once per address)
    function createVote(Choices _choice) external {
        require(!hasVoted[msg.sender], "Already voted");

        votes.push(Vote(_choice, msg.sender));
        hasVoted[msg.sender] = true;
    }

    // Change existing vote
    function changeVote(Choices _choice) external {
        require(hasVoted[msg.sender], "No existing vote");

        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == msg.sender) {
                votes[i].choice = _choice;
                return;
            }
        }
    }

    // Find vote choice of an address
    function findChoice(address user) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == user) {
                return votes[i].choice;
            }
        }

        revert("No vote found");
    }

    // Check if user has voted
    function hasVotedFunc(address user) external view returns (bool) {
        return hasVoted[user];
    }
}