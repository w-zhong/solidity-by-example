// SPDX-License-Identifier: SEE LICENSE IN LICENSE
/**
 * Functions and state variables have to declare whether they are accessible by other contracts.
 * Functions can be declared as
 * - public: any contract and account can call
 * - private: only inside the contract that defines the function
 * - internal: only inside contract that defines the function or inherits contract
 * - external: only other contracts and accounts can call
 * State variables can be declared as public, private, or internal but not external.
 */
pragma solidity ^0.8.7;

contract Base {
    // Public functions can be called
    // - inside this contract
    // - inside contracts that inherit this contract
    // - by other contracts and accounts
    function publicFunc() public pure virtual returns (string memory) {
        return "public function called";
    }

    // Inside the base contract can call public functions.
    function testPublic() public pure virtual returns (string memory) {
        return publicFunc();
    }

    // Private function can only be called inside this contract.
    // Contracts that inherit this contract cannot call this function.
    function privateFunc() private pure returns (string memory) {
        return "privater function called";
    }

    // Inside the base contract can call private functions.
    function testPrivate() public pure virtual returns (string memory) {
        return privateFunc();
    }

    // Internal function can be called
    // - inside this contract
    // - inside contracts that inherit this contract
    function internalFunc() internal pure virtual returns (string memory) {
        return "internal function called";
    }

    // Inside the base contract can call internal functions.
    function testInternal() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // External functions can only be called by other contracts and accounts.
    function externalFunc() external pure virtual returns (string memory) {
        return "external function called";
    }

    // Inside the base contract cannot call external functions.
    // function testExternal() public pure returns (string memory) {
    //     return externalFunc();
    // }

    // State variables
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";
    // State variables cannot be external so this code won't compile.
    // string external externalVar = "my external variable";
}

contract Child is Base {
    // Inheritant contract can call public functions.
    function testPublic() public pure override returns (string memory) {
        return publicFunc();
    }

    // Inheritant contract cannot call private functions.
    // function testPrivate() public pure override returns (string memory) {
    //     return privateFunc();
    // }

    // Inheritant contract can call internal functions.
    function testInternal() public pure override returns (string memory) {
        return internalFunc();
    }

    // Inheritant contract cannot call external functions.
    // function testExternal() public pure override returns (string memory) {
    //     return externalFunc();
    // }
}
