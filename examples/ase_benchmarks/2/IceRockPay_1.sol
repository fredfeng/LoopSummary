






contract C {
  

  

  address[] _address;
uint256[] _amount;
uint256 totalSupply_;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < _address.length; i++){
totalSupply_ = ((totalSupply_) + (_amount[i]));
balances[_address[i]] = ((balances[_address[i]]) + (_amount[i]));

}


  }

  

}

//#LOOPVARS: i


