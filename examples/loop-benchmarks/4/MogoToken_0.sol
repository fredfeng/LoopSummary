
pragma solidity ^0.5.10;



contract C {
  

  address owner;
uint totalValue;
mapping(address => uint256) balanceOf;
address[] addrs;
uint256[] balances;
uint i;

  function foo() public {
    
for(uint i = 0; i < addrs.length; i++){
uint value = balances[i];
balanceOf[addrs[i]] += value;
emit Transfer(owner, addrs[i], value);
totalValue = SafeMath.add(value, totalValue);
}


  }
}

//#LOOPVARS: i
