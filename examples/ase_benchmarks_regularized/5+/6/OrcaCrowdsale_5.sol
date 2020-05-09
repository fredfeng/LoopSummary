






contract C {
  

  

  uint256[] _amounts;
address[] _receivers;
address receiver;
uint256 amount;
mapping(address => uint256) bountyBalances;
uint256 tokensLeft;

  function foo() public {
    
for(uint256 i = 0; i < _receivers.length; i++){
receiver = _receivers[i];
amount = _amounts[i];
require(receiver != address(0));
require(amount > 0);
tokensLeft = ((tokensLeft) - (amount));
bountyBalances[receiver] = ((bountyBalances[receiver]) + (amount));
}


  }

  

}

//#LOOPVARS: i


