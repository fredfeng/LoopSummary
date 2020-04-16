
pragma solidity ^0.5.10;



contract C {
  

  ERC20 ERC20Contract;
uint256[] tokenAmount;
address[] beneficiaries;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < beneficiaries.length; i++){
ERC20Contract.safeTransferFrom(msg.sender, beneficiaries[i], tokenAmount[i]);
}


  }
}

//#LOOPVARS: i

contract ERC20 { }
