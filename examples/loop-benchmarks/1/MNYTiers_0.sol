
pragma solidity ^0.5.10;



contract C {
  

  uint16 _startingTier;
uint[] _futrx;
uint offset;
uint[] _mny;
mapping(uint16 => Tier) tiers;
uint16 i;

  function foo() public {
    
for(uint16 i = 0; i < _mny.length; i++){
tiers[_startingTier + i] = Tier(_mny[i], _futrx[i], (uint(_mny[i])) / ((uint(_futrx[i])) / (offset)));
}


  }
}

//#LOOPVARS: i

contract Tier { }
