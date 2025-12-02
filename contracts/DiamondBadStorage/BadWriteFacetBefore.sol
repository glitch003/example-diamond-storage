// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import { LibDiamondBadStorageBefore } from "./LibDiamondBadStorageBefore.sol";

contract BadWriteFacetBefore {
    function s()
        internal
        pure
        returns (LibDiamondBadStorageBefore.DiamondBadStorage storage)
    {
        return LibDiamondBadStorageBefore.getStorage();
    }

    function getOuterValue1() external view returns (uint256) {
        return s().outerValue1;
    }

    function setOuterValue1(uint256 value) external {
        s().outerValue1 = value;
    }

    function getNestedValue1() external view returns (uint256) {
        return s().nestedStructThatCanGrow.nestedValue1;
    }

    function setNestedValue1(uint256 value) external {
        s().nestedStructThatCanGrow.nestedValue1 = value;
    }
}