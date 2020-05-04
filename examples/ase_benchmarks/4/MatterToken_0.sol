






contract C {
  

  

  uint256[] _amounts;
uint256 totalSupply_;
mapping(address => uint256) balances;
address[] _holders;

  function foo() public {
    
for(uint256 i = 0; i < _holders.length; ++i){
address holder = _holders[i];
uint256 amount = _amounts[i];
totalSupply_ = ((totalSupply_) + (amount));
balances[holder] = ((balances[holder]) + (amount));


}


  }

  

}

//#LOOPVARS: i


