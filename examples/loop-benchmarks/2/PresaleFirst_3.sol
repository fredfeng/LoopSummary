
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) buyers;
uint256 i;
address[] keys;

  function foo() public {
    
for(uint256 i = 0; i < keys.length; i++){
keys[i].transfer(buyers[keys[i]]);
emit Refund(keys[i], buyers[keys[i]]);
}


  }
}

//#LOOPVARS: i
