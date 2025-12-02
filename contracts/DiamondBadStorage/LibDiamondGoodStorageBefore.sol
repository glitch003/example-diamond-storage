//SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.28;

library LibDiamondGoodStorageBefore {
    bytes32 constant DIAMOND_GOOD_STORAGE_POSITION = keccak256("diamondgoodstorage.storage");

    struct NestedNestedStructThatCanGrow {
        uint256 nestedNestedValue1;
    }

    struct NestedStruct {
        uint256 nestedValue1;
        NestedNestedStructThatCanGrow[] nestedNestedStructThatCanGrow;
        uint256 nestedValue2;
    }

    struct DiamondGoodStorage {
        mapping(uint256 => NestedStruct) nestedStruct;
        uint256 outerValue1;
    }

    // Return ERC721 storage struct for reading and writing
    function getStorage()
        internal
        pure
        returns (DiamondGoodStorage storage storageStruct)
    {
        bytes32 position = DIAMOND_GOOD_STORAGE_POSITION;
        assembly {
            storageStruct.slot := position
        }
    }
}
