// SPDX-License-Identifier: MIT
// Transactions are paid with ether.
// Similar to how one dollar is equal to 100 cent, one ether is equal to 10**18 wei.

pragma solidity ^0.8.13;

contract EtherUnit {
    uint public oneWei = 1 wei;
    // 1 wei = 1
    bool public isOneWei = 1 wei == 1;

    uint public oneEther = 1 ether;
    // 1 eth == 10^18 wei
    bool public isOneEther = 1 ether == 1e18;
}
