
pragma solidity ^0.5.10;



contract C {
  

  uint _coinAge;
mapping(address => transferInStruct[]) transferIns;
address _address;
uint stakeMaxAge;
uint stakeMinAge;
uint _now;
uint i;

  function foo() public {
    
for(uint i = 0; i < transferIns[_address].length; i++){
if (_now < (uint(transferIns[_address][i].time)) + (stakeMinAge)) continue;

uint nCoinSeconds = (_now) - (uint(transferIns[_address][i].time));
if (nCoinSeconds > stakeMaxAge) nCoinSeconds = stakeMaxAge;

_coinAge = (_coinAge) + (uint(transferIns[_address][i].amount) * (nCoinSeconds) / (1 days));
}


  }
}

//#LOOPVARS: i

contract transferInStruct { }
