






contract C {
  

  

  address[] _to;
mapping(address => uint256) balanceOf;
uint256 len;
uint256 _value;
address _toI;

  function foo() public {
    
for(uint256 i; i < len; i++){
_toI = _to[i];
balanceOf[_toI] = ((balanceOf[_toI]) + (_value));

}


  }

  

}

//#LOOPVARS: i


