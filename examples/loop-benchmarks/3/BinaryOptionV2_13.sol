
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => mapping(address => bool)) confirmations;
uint required;
uint count;
uint transactionId;
uint i;
address[] owners;

  function foo() public {
    
for(uint i = 0; i < owners.length; i++){
if (confirmations[transactionId][owners[i]]) count += 1;

if (count == required) return true;

}


  }
}

//#LOOPVARS: i

contract uint => mappingaddress { }
