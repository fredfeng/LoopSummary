






contract C {
  

  

  address[] _to;
uint256 i;
uint256[] _amount;
uint256 amountSum;
mapping(address => bool) locked;

  function foo() public {
    
for(uint i = 0; i < _amount.length; i++){
require(_amount[i] > 0);
require(_to[i] != address(0));
require(locked[_to[i]] != true);
amountSum = ((amountSum) + (_amount[i]));
}


  }

  

}

//#LOOPVARS: i


