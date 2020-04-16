
pragma solidity ^0.5.10;



contract C {
  

  Dividend[] dividends;
uint256 j;
uint256 counter;
uint256 _checkpointId;
uint256[] index;

  function foo() public {
    
for(uint256 j = 0; j < dividends.length; j++){
if (dividends[j].checkpointId == _checkpointId) {
index[counter] = j;
counter++;
}

}


  }
}

//#LOOPVARS: j

contract Dividend { }
