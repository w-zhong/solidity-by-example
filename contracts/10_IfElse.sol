// SPDX-License-Identifier: SEE LICENSE IN LICENSE
// Solidity supports conditional statements if, else if and else.

pragma solidity ^0.8.13;

contract IfElse {
    function foo(uint x) public pure returns (uint) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function tenery(uint _x) public pure returns (uint) {
        return _x < 10 ? 0 : 1;
    }
}
