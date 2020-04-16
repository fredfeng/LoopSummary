
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
mapping(address => uint256[]) releaseTimes;
address _address;
mapping(address => uint256[]) lockupBalances;
uint i;

  function foo() public {
    
for(uint i = 0; i < 7; i++){
if (releaseTimes[_address][i] != 0 && now >= releaseTimes[_address][i]) {
balances[_address] = (balances[_address]) + (lockupBalances[_address][i]);
lockupBalances[_address][i] = 0;
releaseTimes[_address][i] = 0;
}

}


  }
}

//#LOOPVARS: i
