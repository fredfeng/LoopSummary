
pragma solidity ^0.5.10;



contract C {
  

  bool executed;
bool pending;
mapping(uint => Transaction) transactions;
uint count;
uint transactionCount;
uint i;

  function foo() public {
    
for(uint i = 0; i < transactionCount; i++){
if (pending && !transactions[i].executed || executed && transactions[i].executed) count += 1;

}


  }
}

//#LOOPVARS: i

contract Transaction { }
