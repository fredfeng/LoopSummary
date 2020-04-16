
pragma solidity ^0.5.10;



contract C {
  

  ERC20 token;
uint256 rate;
mapping(address => uint256) buyers;
uint256 i;
address[] keys;

  function foo() public {
    
for(uint256 i = 0; i < keys.length; i++){
token.safeTransfer(keys[i], (buyers[keys[i]]) * (rate));
emit Release(keys[i], (buyers[keys[i]]) * (rate));
}


  }
}

//#LOOPVARS: i

contract ERC20 { }
