






contract C {
  

  

  uint16[] Gate;
mapping(address => uint256) tokenBalance;
uint8 i;
address _customerAddress;

  function foo() public {
    
for(uint i = 0; i < Gate.length; i++){
if (tokenBalance[_customerAddress] < Gate[i]) {
break;
}

}


  }

  

}

//#LOOPVARS: i


