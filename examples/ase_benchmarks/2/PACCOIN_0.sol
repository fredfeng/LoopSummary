






contract C {
  

  

  address[] _tos;
uint256 i;
uint256 sum;
uint256[] _amount;

  function foo() public {
    
for(i = 0; i < _amount.length; i++){
sum = ((sum) + (_amount[i]));
require(_tos[i] != address(0));
}


  }

  

}

//#LOOPVARS: i


