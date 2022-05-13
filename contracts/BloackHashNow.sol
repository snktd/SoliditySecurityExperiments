// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

contract BlockHashNow {
    event Win();
    event Lose();

    function attempt(uint256 input) external {
        uint256 roll = uint256(blockhash(block.number));
        if ((roll & 1) == input) {
            
            emit Win();
        } else {
            emit Lose();
        }
    }

    function insecureAttempt() external {
        this.attempt(uint256(blockhash(block.number)));
    }
}
