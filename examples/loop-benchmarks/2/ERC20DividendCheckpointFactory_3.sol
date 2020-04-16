
pragma solidity ^0.5.10;



contract C {
  

  uint256 _checkpointId;
Dividend[] dividends;
uint256 i;
uint256 counter;

  function foo() public {
    
for(uint256 i = 0; i < dividends.length; i++){
if (dividends[i].checkpointId == _checkpointId) {
counter++;
}

}


  }
}

//#LOOPVARS: i

contract Dividend { }
