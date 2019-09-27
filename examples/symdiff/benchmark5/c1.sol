pragma solidity ^0.5.10;

contract C1 {
    
    function foo(uint[] memory values, uint i) public {

        while (i<values.length-1) {
            values[i] = values[i+1];
            i++;
        }

    }
}



