






contract C {
  

  

  address[] _owners;
mapping(address => uint) balances;
uint256 totalSupply;

  function foo() public {
    
for(uint i = 0; i < _owners.length; i++){
balances[_owners[i]] = ((totalSupply) / (_owners.length));
}


  }

  

}

//#LOOPVARS: i


