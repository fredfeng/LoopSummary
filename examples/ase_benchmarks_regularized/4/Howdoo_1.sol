






contract C {
  

  

  uint256 amendCount;
uint256 amount;
uint256 totalSupply_;
mapping(address => uint256) balances;
address[] _holders;

  function foo() public {
    
for(uint256 i = 0; i < _holders.length; i++){
require(amendCount > 0);
amendCount--;
totalSupply_ = ((totalSupply_) - (amount));
balances[_holders[i]] = ((balances[_holders[i]]) - (amount));

}


  }

  

}

//#LOOPVARS: i


