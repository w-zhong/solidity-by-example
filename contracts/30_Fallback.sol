// SPDX-License-Identifier: SEE LICENSE IN LICENSE
/**
 * fallback is a special function that is executed either when
 * - a function that does not exist is called
 * - Ether is sent directly to a contract but receive() does not exist
 * - msg.data is not empty
 * fallback has a 2300 gas limit when called by transfer or send.
 */
pragma solidity ^0.8.7;

contract Fallback {
    event Log(string func, uint gas);

    // Fallback function must be declared as external.
    fallback() external payable {
        // send / transfer (forwards 2300 gas to this fallback function)
        // call (forwards all of the gas)
        emit Log("fallback", gasleft());
    }

    // Receive is a variant of fallback that is triggered when msg.data is empty
    receive() external payable {
        emit Log("receive", gasleft());
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether.");
    }
}

contract FallbackWithData {
    address immutable target;

    event Log(bytes res);

    constructor(address _target) {
        target = _target;
    }

    fallback(bytes calldata data) external payable returns (bytes memory) {
        (bool ok, bytes memory res) = target.call{value: msg.value}(data);
        require(ok, "call failed");

        emit Log(res);

        return res;
    }
}

contract TestFallback {
    function test() external payable returns (uint) {
        return 0xFFFFFFFFFFFFF;
    }

    function getTestData() external view returns (bytes memory) {
        return abi.encodeCall(this.test, ());
    }
}
