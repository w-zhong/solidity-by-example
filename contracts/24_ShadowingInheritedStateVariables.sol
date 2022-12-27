// SPDX-License-Identifier: SEE LICENSE IN LICENSE
/**
 * Unlike functions, state variables cannot be overridden by re-declaring it in the child contract.
 * Use constructor to correctly override inherited state variables.
 */
pragma solidity ^0.8.7;

contract A {
    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}

// Shadowing is disallowed in Solidity 0.6
// This will not compile
// contract B is A {
//     string public name = "Contract B";
// }

// This is the correct way to override inherited state variables.
contract C is A {
    constructor() {
        name = "Contract C";
    }
    // C.getName returns "Contract C"
}
