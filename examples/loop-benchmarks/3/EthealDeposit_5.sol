
pragma solidity ^0.5.10;



contract C {
  

  uint256 results;
uint256 i;
bool _nonCleared;
mapping(uint256 => Deposit) transactions;
uint256[] _ids;
uint256 transactionCount;
bool _cleared;

  function foo() public {
    
for(i = 0; i < transactionCount; i++){
if (_cleared && transactions[i].cleared || _nonCleared && !transactions[i].cleared) {
_ids[results] = i;
results++;
}

}


  }
}

//#LOOPVARS: i

contract Deposit { }
