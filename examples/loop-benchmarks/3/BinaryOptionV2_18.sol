
pragma solidity ^0.5.10;



contract C {
  

  bool executed;
bool pending;
mapping(uint => Transaction) transactions;
uint[] transactionIdsTemp;
uint count;
uint transactionCount;
uint i;

  function foo() public {
    
for(i = 0; i < transactionCount; i++){
if (pending && !transactions[i].executed || executed && transactions[i].executed) {
transactionIdsTemp[count] = i;
count += 1;
}

}


  }
}

//#LOOPVARS: i

contract Transaction { }
