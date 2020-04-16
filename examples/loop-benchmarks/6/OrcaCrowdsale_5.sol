
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _amounts;
address[] _receivers;
uint256 i;
uint256 tokensLeft;
mapping(address => uint256) bountyBalances;
uint256 amount;
address receiver;

  function foo() public {
    
for(uint256 i = 0; i < _receivers.length; i++){
receiver = _receivers[i];
amount = _amounts[i];
require(receiver != address(0));
require(amount > 0);
tokensLeft = (tokensLeft) - (amount);
bountyBalances[receiver] = (bountyBalances[receiver]) + (amount);
}


  }
}

//#LOOPVARS: i
