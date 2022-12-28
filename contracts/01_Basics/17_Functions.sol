// SPDX-License-Identifier: SEE LICENSE IN LICENSE
/**
 * There are several ways to return outputs from a function.
 * Public functions cannot accept certain data types as inputs or outputs.
 */

pragma solidity ^0.8.7;

contract Functions {
    // Function can return many values.
    function returnMany(
        uint _uint1,
        bool _bool,
        uint _uint2
    ) public pure returns (uint, bool, uint) {
        return (_uint1, _bool, _uint2);
    }

    // Return values can be named.
    function named() public pure returns (uint a, bool b, uint c) {
        return (1, true, 2);
    }

    // Return values can be assigned to their names, in this case return statement can be ommited.
    function assigned() public pure returns (uint a, bool b, uint c) {
        // return (a = 1, b = true, c = 2);
        a = 1;
        b = true;
        c = 2;
    }

    // Use destructuring assignment when calling another function that returns multiple values.
    function destructuringAssignments()
        public
        pure
        returns (uint, bool, uint, uint, uint)
    {
        (uint i, bool b, uint j) = returnMany(1, true, 2);

        (uint x, , uint y) = (4, 5, 6); // Values can be left out.

        return (i, b, j, x, y); // 1, true, 2, 4, 6
    }

    /**
     * Cannot use mapping for neither input nor output.
     * Array is ok, must be memory or calldata.
     * */
    uint[] public arr;

    function arrInput(uint[] memory _arr) public {}

    function arrOutput() public view returns (uint[] memory) {
        return arr;
    }

    // Call function with key-value inputs
    function someFuncWithManyInputs(
        uint x,
        uint y,
        uint z,
        address a,
        bool b,
        string memory c
    ) public pure returns (uint) {}

    function callFunc() external pure returns (uint) {
        return someFuncWithManyInputs(1, 2, 3, address(0), true, "c");
    }

    function callFuncWithKeyValue() external pure returns (uint) {
        return
            someFuncWithManyInputs({
                a: address(0),
                b: true,
                c: "c",
                x: 1,
                y: 2,
                z: 3
            });
    }
}
