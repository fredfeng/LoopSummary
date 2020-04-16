
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint16[] Gate;
mapping(address => uint256) tokenBalance;
address _customerAddress;

  function foo() public {
    
for(i = 0; i < Gate.length; i++){
if (tokenBalance[_customerAddress] < Gate[i]) {
break;
}

}


  }
}

//#LOOPVARS: i
