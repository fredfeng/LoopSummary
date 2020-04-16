
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
mapping(address => uint256) balanceOf;
uint j;
uint256[] amounts;

  function foo() public {
    
for(j = 0; j < addresses.length; j++){
balanceOf[msg.sender] = (balanceOf[msg.sender]) - (amounts[j]);
balanceOf[addresses[j]] = (balanceOf[addresses[j]]) + (amounts[j]);
emit Transfer(msg.sender, addresses[j], amounts[j]);
}


  }
}

//#LOOPVARS: j
