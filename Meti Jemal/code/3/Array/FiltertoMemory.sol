pragma solidity ^0.8.20;

contract Contract {

    function filterEven(uint[] calldata nums)
        external
        pure
        returns (uint[] memory)
    {
        uint count = 0;

        // 1. Count even numbers
        for (uint i = 0; i < nums.length; i++) {
            if (nums[i] % 2 == 0) {
                count++;
            }
        }

        // 2. Create memory array with exact size
        uint[] memory evens = new uint[](count);

        // 3. Fill array
        uint index = 0;
        for (uint i = 0; i < nums.length; i++) {
            if (nums[i] % 2 == 0) {
                evens[index] = nums[i];
                index++;
            }
        }

        return evens;
    }
}