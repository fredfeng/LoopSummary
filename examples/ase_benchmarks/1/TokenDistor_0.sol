






contract C {
  

  

  address[] _tos;
uint256 totalSendingAmt;
uint256[] _amts;

  function foo() public {
    
for(uint i = 0; i < _tos.length; i++){
totalSendingAmt = add(totalSendingAmt, _amts[i]);
}


  }

  

}

//#LOOPVARS: i


