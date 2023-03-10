// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.7;

/**
 * Contract can call other contracts in 2 ways.
 * The easiest way to is to just call it, like A.foo(x, y, z).
 * Another way to call other contracts is to use the low-level call.
 * This method is not recommended.
 */

contract Callee {
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;

        return (x, value);
    }
}

contract Caller {
    function setX(Callee _callee, uint _x) public returns (uint) {
        uint x = _callee.setX(_x);
        return x;
    }

    function setXFromAddress(address _addr, uint _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }

    function setXandSendEther(
        Callee _callee,
        uint _x
    ) public payable returns (uint, uint) {
        (uint x, uint value) = _callee.setXandSendEther{value: msg.value}(_x);
        return (x, value);
    }
}
