
pragma solidity ^0.5.10;



contract C {
  

  uint MAXRAND;
mapping(uint => PredUnit[]) arrIdx2predUnitArr;
uint outputIdx;
uint[] _guess;
uint i;

  function foo() public {
    
for(uint i = 0; i < _guess.length; i++){
PredUnit newUnit = PredUnit(msg.sender, _guess[i]);
arrIdx2predUnitArr[(i + outputIdx) % MAXRAND].push(newUnit);
}


  }
}

//#LOOPVARS: i

contract PredUnit { }
