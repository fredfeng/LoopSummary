
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
mapping(uint8 => mapping(uint16 => uint256)) feeDistribution;
uint16[] _percentages;
uint8 _st;

  function foo() public {
    
for(uint8 i = 0; i < _percentages.length; i++){
feeDistribution[_st][i] = _percentages[i];
}


  }
}

//#LOOPVARS: i

contract uint8 => mappinguint16 { }
