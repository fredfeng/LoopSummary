
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
mapping(address => uint256) balanceOf;
uint i;
uint[] amounts;

  function foo() public {
    
for(i = 0; i < addresses.length; i++){
balanceOf[addresses[i]] = (balanceOf[addresses[i]]) + (amounts[i]);
Transfer(msg.sender, addresses[i], amounts[i]);
}


  }
}

//#LOOPVARS: i
