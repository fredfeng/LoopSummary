






contract C {
  

  

  uint256 _totalMoney;
uint256 _idx;
uint256[] _moneys;

  function foo() public {
    
for(uint _idx = 0; _idx < _moneys.length; _idx++){
_totalMoney += _moneys[_idx];
}


  }

  

}

//#LOOPVARS: _idx


