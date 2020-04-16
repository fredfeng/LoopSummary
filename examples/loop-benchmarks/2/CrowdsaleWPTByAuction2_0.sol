
pragma solidity ^0.5.10;



contract C {
  

  address[] beneficiaryAddresses;
mapping(address => uint256) _balances;
uint256 priceWPTperETH;
uint beneficiaryCount;
Token minterContract;
uint i;

  function foo() public {
    
for(uint i = 0; i < beneficiaryCount; i++){
minterContract.mint(beneficiaryAddresses[i], (_balances[beneficiaryAddresses[i]]) * (priceWPTperETH));
delete _balances[beneficiaryAddresses[i]];
}


  }
}

//#LOOPVARS: i

contract Token { }
