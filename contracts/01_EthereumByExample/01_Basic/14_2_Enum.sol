// SPDX-License-Identifier: SEE LICENSE IN LICENSE
/**
 * Solidity supports enumerables and they are useful to model choice and keep track of state.
 * Enums can be declared outside of a contract.
 */

pragma solidity ^0.8.7;

contract Enum {
    // Enum representing shipping status.
    enum Status {
        Pending,
        Delivered,
        Accepted,
        Cancelled,
        Returned
    }

    // Default value is the first element listed in definition of the type, in this case "Pending".
    Status public status;

    /**
     * Returns uint
     *   Pending  - 0
     *   Shipped  - 1
     *   Accepted - 2
     *   Rejected - 3
     *   Canceled - 4
     */
    function get() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input.
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this.
    function pending() public {
        status = Status.Pending;
    }

    function delivered() public {
        status = Status.Delivered;
    }

    // Delete resets the enum to its first value, 0.
    function remove() public {
        delete status;
    }
}

import "./14_1_EnumDeclaration.sol";

contract ImportEnum {
    ImportStatus public status;
}
