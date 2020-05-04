






contract C {
  

  

  uint256[] amounts;
uint256 fundersTotal;

  function foo() public {
    
for(uint i = 0; i < amounts.length; i++){
fundersTotal = ((fundersTotal) + (amounts[i]));
}


  }

  

}

//#LOOPVARS: i


