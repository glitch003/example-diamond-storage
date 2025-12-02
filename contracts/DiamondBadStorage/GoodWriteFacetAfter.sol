// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import { LibDiamondGoodStorageAfter } from "./LibDiamondGoodStorageAfter.sol";

contract GoodWriteFacetAfter {
    function s()
        internal
        pure
        returns (LibDiamondGoodStorageAfter.DiamondGoodStorage storage)
    {
        return LibDiamondGoodStorageAfter.getStorage();
    }

    function getOuterValue1() external view returns (uint256) {
        return s().outerValue1;
    }

    function setOuterValue1(uint256 value) external {
        s().outerValue1 = value;
    }

    function getNestedValue1() external view returns (uint256) {
        return s().nestedStruct.nestedValue1;
    }

    function setNestedValue1(uint256 value) external {
        s().nestedStruct.nestedValue1 = value;
    }
    
    function getNestedValue2() external view returns (uint256) {
        return s().nestedStruct.nestedValue2;
    }

    function setNestedValue2(uint256 value) external {
        s().nestedStruct.nestedValue2 = value;
    }

    function getNestedNestedValue1(uint256 index) external view returns (uint256) {
        assert(index < s().nestedStruct.nestedNestedStructThatCanGrow.length);
        return s().nestedStruct.nestedNestedStructThatCanGrow[index].nestedNestedValue1;
    }

    function setNestedNestedValue1(uint256 index, uint256 value) external {
        if (index >= s().nestedStruct.nestedNestedStructThatCanGrow.length) {
            s().nestedStruct.nestedNestedStructThatCanGrow.push(LibDiamondGoodStorageAfter.NestedNestedStructThatCanGrow({
                nestedNestedValue1: 0,
                nestedNestedValue2: value
            }));
        } else {
            s().nestedStruct.nestedNestedStructThatCanGrow[index].nestedNestedValue1 = value;
        }
    }

    function getNestedNestedValue2(uint256 index) external view returns (uint256) {
        assert(index < s().nestedStruct.nestedNestedStructThatCanGrow.length);
        return s().nestedStruct.nestedNestedStructThatCanGrow[index].nestedNestedValue2;
    }

    function setNestedNestedValue2(uint256 index, uint256 value) external {
        if (index >= s().nestedStruct.nestedNestedStructThatCanGrow.length) {
            s().nestedStruct.nestedNestedStructThatCanGrow.push(LibDiamondGoodStorageAfter.NestedNestedStructThatCanGrow({
                nestedNestedValue1: 0,
                nestedNestedValue2: value
            }));
        } else {
            s().nestedStruct.nestedNestedStructThatCanGrow[index].nestedNestedValue2 = value;
        }
    }
}