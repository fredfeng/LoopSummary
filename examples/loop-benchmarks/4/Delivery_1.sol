
pragma solidity ^0.5.10;



contract C {
  

  uint256 decimals;
uint256 index;
address[] _vaddr;
Peculium pecul;
uint256[] _vamounts;

  function foo() public {
    
for(uint256 index = 0; index < _vaddr.length; index++){
address toAddress = _vaddr[index];
uint256 amountTo_Send = (_vamounts[index]) * (10 ** decimals);
pecul.transfer(toAddress, amountTo_Send);
AirdropOne(toAddress, amountTo_Send);
}


  }
}

//#LOOPVARS: index

contract Peculium { }
