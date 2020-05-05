






contract C {
  

  

  uint256 _size;
address owner;
uint256 amount;
address[] payees;
mapping(address => uint256) balances;
uint256 airdropValue;

  function foo() public {
    
for(uint i = 0; i < _size; i++){
if (payees[i] == address(0)) {
amount = ((amount) - (airdropValue));
continue;
}

balances[payees[i]] = ((balances[payees[i]]) + (airdropValue));

}


  }

  

}

//#LOOPVARS: i


