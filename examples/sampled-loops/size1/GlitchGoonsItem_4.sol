
pragma solidity ^0.5.10;



contract C {
  

  address[] owners;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < owners.length; i++){
_mint(owners[i], 2 * 10 ** 6);
}


  }
}

//#LOOPVARS: i
