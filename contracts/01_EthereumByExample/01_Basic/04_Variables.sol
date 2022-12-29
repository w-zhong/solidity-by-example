// SPDX-License-Identifier: SEE LICENSE IN LICENSE
/**
 * There are 3 types of variables in Solidity
 * 1. local: declared inside a function, not stored on the blockchain
 * 2. state: declared outside a function, stored on the blockchain
 * 3. global: provides information about the blockchain
 */

pragma solidity ^0.8.13;

contract Variables {
    // State variables are stored on the blockchain.
    string public text = "Hello";
    uint public num = 123;

    function doSomething() public pure returns (uint) {
        // Local variables are not saved to the blockchain.
        uint i = 456;
        return i;
    }

    function doSomething2() public view returns (uint) {
        // Here are some global variables
        uint timestamp = block.timestamp; // Current block timestamp
        return timestamp;
    }

    function doSomething3() public view returns (address) {
        // Here are some global variables
        address sender = msg.sender; // address of the caller
        return sender;
    }
}
