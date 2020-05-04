






contract C {
  

  

  uint total;
uint256[] amounts;
mapping(address => uint256) balanceOf;
address[] recipients;

  function foo() public {
    
for(uint i = 0; i < recipients.length; ++i){
balanceOf[recipients[i]] = ((balanceOf[recipients[i]]) + (amounts[i]));
total = ((total) + (amounts[i]));

}


  }

  

}

//#LOOPVARS: i


