
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalValue;
uint256[] _value;
uint256 i;

  function foo() public {
    
while(i < _value.length){
totalValue = (totalValue) + (_value[i]);
i++;
}

  }
}

//#LOOPVARS: 
