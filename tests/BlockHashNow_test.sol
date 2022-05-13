// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "remix_tests.sol"; // this import is automatically injected by Remix.
import "hardhat/console.sol";
import "../contracts/BlockHashNow.sol";

contract BallotTest {
      
    BlockHashNow blockToTest;
    function beforeAll () public {
        blockToTest = new BlockHashNow();
    }
    
    function checkWinningProposal () public {
        console.log("Running checkWinningProposal");
        ballotToTest.vote(0);
        Assert.equal(ballotToTest.winningProposal(), uint(0), "proposal at index 0 should be the winning proposal");
        Assert.equal(ballotToTest.winnerName(), bytes32("candidate1"), "candidate1 should be the winner name");
    }
    
    function checkWinninProposalWithReturnValue () public view returns (bool) {
        return ballotToTest.winningProposal() == 0;
    }
}
