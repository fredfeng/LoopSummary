pragma solidity ^0.5.10;

contract C2 {
    
    uint i0;
    
    function foo(uint[] memory values) public {

        for(uint i=i0; i < values.length-1;i++){
            values[i] = values[i+1];
        }

    }
}


