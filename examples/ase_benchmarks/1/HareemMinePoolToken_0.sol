






contract C {
  

  

  mapping(address => uint256) amountLeftToBePaid;
uint amount;
address[] listAddr;

  function foo() public {
    
for(uint i = 0; i < listAddr.length; i++){
amount = amount + amountLeftToBePaid[listAddr[i]];
}


  }

  

}

//#LOOPVARS: i


