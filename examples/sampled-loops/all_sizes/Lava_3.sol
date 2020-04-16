
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => Rand) rands;
uint nWinners;
mapping(uint => PredUnit) winners;
mapping(uint => PredUnit[]) arrIdx2predUnitArr;
uint outputIdx;
uint i;

  function foo() public {
    
for(i = 0; i < arrIdx2predUnitArr[outputIdx].length; i++){
if (arrIdx2predUnitArr[outputIdx][i].value == rands[outputIdx].value) {
winners[i] = arrIdx2predUnitArr[outputIdx][i];
nWinners++;
}

}


  }
}

//#LOOPVARS: i

contract PredUnit { }

contract Rand { }
