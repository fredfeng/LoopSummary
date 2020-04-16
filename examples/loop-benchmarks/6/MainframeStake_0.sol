
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
address[] addresses;
ERC20 token;
uint256 totalDepositBalance;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < addresses.length; i++){
address _address = addresses[i];
require(balances[_address] > 0);
token.transfer(_address, balances[_address]);
totalDepositBalance = (totalDepositBalance) - (balances[_address]);
emit RefundedBalance(_address, balances[_address]);
balances[_address] = 0;
}


  }
}

//#LOOPVARS: i

contract ERC20 { }
