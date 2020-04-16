
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint256 => InvestorTokenVault) investorVaults;
uint256 withdrawNum;
uint256 i;
uint256 _amount;
TokenInfo tokenInfo;
uint256 _start;
uint256 lockNum;
uint256 lockTime;
uint256 _id;

  function foo() public {
    
for(uint256 i = 0; i < 10; i++){
lockTime = _start + ((tokenInfo.lockperiod) / (10)) * ((i) + (1));
lockNum = investorVaults[_id].locks;
withdrawNum = investorVaults[_id].withdraws;
if (lockNum >= 10 && lockNum >= (withdrawNum) + (10)) {
if (investorVaults[_id].lockTime[((lockNum) - (10)) + (i)] == lockTime) {
investorVaults[_id].lockValue[((lockNum) - (10)) + (i)] = (investorVaults[_id].lockValue[((lockNum) - (10)) + (i)]) + ((_amount) / (10));
} else {
investorVaults[_id].lockTime[lockNum] = lockTime;
investorVaults[_id].lockValue[lockNum] = (_amount) / (10);
investorVaults[_id].locks++;
}

} else {
investorVaults[_id].lockTime[lockNum] = lockTime;
investorVaults[_id].lockValue[lockNum] = (_amount) / (10);
investorVaults[_id].locks++;
}

emit TokenLocked(_id, (_amount) / (10), lockTime);
}


  }
}

//#LOOPVARS: i

contract InvestorTokenVault { }

contract TokenInfo { }
