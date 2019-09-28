pragma solidity ^0.5.10;

contract C2 {
    
    function foo(uint[] memory values, uint i0) public {

        for(uint i=i0; i < values.length-1;i++){
            values[i] = values[i+1];
        }

    }
}


