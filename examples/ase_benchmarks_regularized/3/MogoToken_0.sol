






contract C {
  

  

  uint totalValue;
mapping(address => uint256) balanceOf;
uint256[] balances;
address owner;
address[] addrs;

  function foo() public {
    
for(uint i = 0; i < addrs.length; i++){
uint value = balances[i];
balanceOf[addrs[i]] += value;

totalValue = ((value) + (totalValue));
}


  }

  

}

//#LOOPVARS: i


