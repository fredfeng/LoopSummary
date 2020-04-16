
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => mapping(address => bool)) confirmations;
uint count;
uint transactionId;
address[] confirmationsTemp;
uint i;
address[] owners;

  function foo() public {
    
for(i = 0; i < owners.length; i++){
if (confirmations[transactionId][owners[i]]) {
confirmationsTemp[count] = owners[i];
count += 1;
}

}


  }
}

//#LOOPVARS: i

contract uint => mappingaddress { }
