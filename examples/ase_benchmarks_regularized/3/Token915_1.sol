






contract C {
  

  

  address[] _to;
uint256[] _value;
mapping(address => uint256) balanceOf;
uint256 _valueI;
uint256 len;
address _toI;

  function foo() public {
    
for(uint256 i; i < len; i++){
_toI = _to[i];
_valueI = _value[i];
balanceOf[_toI] = ((balanceOf[_toI]) + (_valueI));

}


  }

  

}

//#LOOPVARS: i


