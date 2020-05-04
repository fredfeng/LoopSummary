






contract C {
  

  

  uint length_;
address[] _receivers;
uint256 _value;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < length_; i++){
require(((balances[_receivers[i]]) + (_value)) < balances[_receivers[i]]);
balances[_receivers[i]] = ((balances[_receivers[i]]) + (_value));

}


  }

  

}

//#LOOPVARS: i


