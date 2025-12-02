// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import { LibDiamondBadStorageAfter } from "./LibDiamondBadStorageAfter.sol";

contract BadWriteFacetAfter {
    function s()
        internal
        pure
        returns (LibDiamondBadStorageAfter.DiamondBadStorage storage)
    {
        return LibDiamondBadStorageAfter.getStorage();
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

    function getNestedValue2() external view returns (uint256) {
        return s().nestedStructThatCanGrow.nestedValue2;
    }

    function setNestedValue2(uint256 value) external {
        s().nestedStructThatCanGrow.nestedValue2 = value;
    }
}