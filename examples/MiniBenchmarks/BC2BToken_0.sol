
pragma solidity ^0.5.10;



contract C {
  

  address[] wallets;
uint[] nWallets;
uint index;
mapping(uint => uint) iWallets;

  function foo() public {
    
for(uint index = 0; index < wallets.length; index++){
nWallets[2 + index] = uint(wallets[index]);
iWallets[uint(wallets[index])] = index + 2;
}


  }
}

//#LOOPVARS: index
