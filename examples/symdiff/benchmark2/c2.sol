pragma solidity ^0.5.10;

contract C2 {
    
    uint256 public constant Factor = 1000;

    function foo(uint256[] memory _amountOfLands) public {

        uint totalAmount = 0;
        for(uint i=0; i < _amountOfLands.length;i++){
            totalAmount = totalAmount + (_amountOfLands[i]*Factor);
        }

    }
}

