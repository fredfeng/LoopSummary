pragma solidity ^0.5.10;

contract C1 {

    uint i0;
    
    function foo(uint[] memory values) public {

        uint i = i0;
        while (i<values.length-1) {
            values[i] = values[i+1];
            i++;
        }

    }
}



