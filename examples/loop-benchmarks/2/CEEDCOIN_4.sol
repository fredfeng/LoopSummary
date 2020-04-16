
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
mapping(address => uint256) balanceOf;
uint[] amounts;
uint j;

  function foo() public {
    
for(j = 0; j < addresses.length; j++){
balanceOf[addresses[j]] = (balanceOf[addresses[j]]) + (amounts[j]);
Transfer(msg.sender, addresses[j], amounts[j]);
}


  }
}

//#LOOPVARS: j
