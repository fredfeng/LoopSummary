
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) buyerBonus;
ERC20 token;
uint i;
address[] buyerList;

  function foo() public {
    
for(uint i = 0; i < buyerList.length; i++){
uint256 amount = buyerBonus[buyerList[i]];
token.transfer(buyerList[i], amount);
buyerBonus[buyerList[i]] = 0;
}


  }
}

//#LOOPVARS: i

contract ERC20 { }
