
pragma solidity ^0.5.10;



contract C {
  

  uint256 __total;
address _to;
mapping(address => uint256[]) lockupBalances;
uint256[] amount;
uint j;
uint256 _first_release;
mapping(address => uint256[]) releaseTimes;

  function foo() public {
    
for(uint j = 0; j < amount.length; j++){
require(lockupBalances[_to][j] == 0);
__total = (__total) + (amount[j]);
lockupBalances[_to][j] = (lockupBalances[_to][j]) + (amount[j]);
releaseTimes[_to][j] = _first_release + (j * 30 days);
}


  }
}

//#LOOPVARS: j
