pragma solidity ^0.5.10;

contract C1 {
    
    uint256 public constant Factor = 1000;

    function foo(uint256[] memory _amountOfLands) public {

        uint256 totalAmount = 0;
        for (uint256 i; i < _amountOfLands.length; i++) {
            uint256 amount = _amountOfLands[i] * Factor;
            totalAmount = totalAmount + amount;
        }

    }
}

