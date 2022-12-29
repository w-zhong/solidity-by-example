// SPDX-License-Identifier: SEE LICENSE IN LICENSE
/**
 * Getter function can be delcared as view or pure.
 * view: no state change, can read state.
 * pure: no state change, no state read.
 */
pragma solidity ^0.8.7;

contract ViewAndPure {
    uint x = 5;

    function addToX(uint y) public view returns (uint) {
        return (x + y);
    }

    function add(uint y, uint z) public pure returns (uint) {
        return (y + z);
    }
}
