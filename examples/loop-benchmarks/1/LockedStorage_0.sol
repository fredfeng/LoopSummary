
pragma solidity ^0.5.10;



contract C {
  

  address[] accountAddresses;
address _wallet;
uint i;

  function foo() public {
    
for(i < accountAddresses.length; i = (i) + (1)){
if (accountAddresses[i] == _wallet) {
break;
}

}


  }
}

//#LOOPVARS: i
