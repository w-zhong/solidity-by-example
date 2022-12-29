// SPDX-License-Identifier: SEE LICENSE IN LICENSE
/**
 * Maps are created with the syntax mapping(keyType => valueType).
 * The keyType can be any built-in value type, bytes, string, or any contract.
 * valueType can be any type including another mapping or an array.
 * Mappings are not iterable.
 */

pragma solidity ^0.8.13;

contract Mapping {
    mapping(address => uint) myMap;

    function get(address _address) public view returns (uint) {
        return myMap[_address];
    }

    function set(address _address, uint _uint) public {
        myMap[_address] = _uint;
    }

    function remove(address _address) public {
        delete myMap[_address];
    }
}

contract NestedMapping {
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _address, uint _uint) public view returns (bool) {
        return nested[_address][_uint];
    }

    function set(address _address, uint _uint, bool _bool) public {
        nested[_address][_uint] = _bool;
    }

    function remove(address _address, uint _uint) public {
        delete nested[_address][_uint];
    }
}
