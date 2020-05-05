






contract C {
  

  

  uint _unRelease;
uint256[] _amount;

  function foo() public {
    
for(uint i = 0; i < _amount.length; i++){
_unRelease = ((_unRelease) + (_amount[i]));
}


  }

  

}

//#LOOPVARS: i


