// SPDX-License-Identifier: MIT
/**
 * How to send Ether? You can send Ether to other contracts by:
 * - transfer (2300 gas, throws error)
 * - send (2300 gas, returns bool)
 * - call (forward all gas or set gas, returns bool)
 * How to receive Ether? A contract receiving Ether must have at least one of the functions below:
 * - receive() external payable
 * - fallback() external payable
 * - receive() is called if msg.data is empty, otherwise fallback() is called.
 * Which method should you use?
 * Call in combination with re-entrancy guard is the recommended method to use after December 2019.
 * Guard against re-entrancy by:
 * - making all state changes before calling other contracts
 * - using re-entrancy guard modifier
 */
pragma solidity ^0.8.17;

contract ReceiveEther {
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // No gas limit, no revert after fail.
        // Recommend.
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    function sendViaTransfer(address payable _to) public payable {
        // Gas limit 2300, revert after fail.
        // Not recommend.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // Send returns a boolean value indicating success or failure.
        // Gas limit 2300, not revert after fail.
        // Not recommend.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }
}
