pragma solidity ^0.8.20;

contract Contract {

    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    function createVote(Choices _choice) external {
        votes.push(Vote(_choice, msg.sender));
    }

    // Check if address has voted
    function hasVoted(address user) external view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == user) {
                return true;
            }
        }
        return false;
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
}