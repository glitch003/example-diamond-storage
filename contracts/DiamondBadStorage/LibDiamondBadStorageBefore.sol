//SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.28;

library LibDiamondBadStorageBefore {
    bytes32 constant DIAMOND_BAD_STORAGE_POSITION = keccak256("diamondbadstorage.storage");

    struct NestedStructThatCanGrow {
        uint256 nestedValue1;
    }

    struct DiamondBadStorage {
        NestedStructThatCanGrow nestedStructThatCanGrow;
        uint256 outerValue1;
    }

    // Return ERC721 storage struct for reading and writing
    function getStorage()
        internal
        pure
        returns (DiamondBadStorage storage storageStruct)
    {
        bytes32 position = DIAMOND_BAD_STORAGE_POSITION;
        assembly {
            storageStruct.slot := position
        }
    }
}
