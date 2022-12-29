// SPDX-License-Identifier: SEE LICENSE IN LICENSE
/**
 * delegatecall is a low level function similar to call.
 * When contract A executes delegatecall to contract B, B's code is executed
 * with contract A's storage, msg.sender and msg.value.
 */
pragma solidity ^0.8.7;

contract B {
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;

    event Response(bool sucess, bytes data);

    function setVars(address _contract, uint _num) public payable {
        (bool sucess, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256", _num)
        );
        emit Response(sucess, data);
    }
}
