
pragma solidity ^0.5.10;



contract C {
  

  address[] depositAddresses;
address _deposit;
uint i;

  function foo() public {
    
for(i < depositAddresses.length; i = (i) + (1)){
if (depositAddresses[i] == _deposit) {
break;
}

}


  }
}

//#LOOPVARS: i
