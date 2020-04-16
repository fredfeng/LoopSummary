
pragma solidity ^0.5.10;



contract C {
  

  uint256 earlier;
mapping(address => uint256) lockNum;
uint256[] currentLockValue;
uint256[] newLockTime;
uint256 j;
address _address;
uint256 i;
uint256[] newLockValue;
uint256 later;
uint256[] currentLockTime;
mapping(address => uint256) balanceP;

  function foo() public {
    
while(i < lockNum[_address]){
if ((now) + (earlier) >= (currentLockTime[i]) + (later)) {
balanceP[_address] = (balanceP[_address]) + (currentLockValue[i]);
emit TokenUnlocked(_address, currentLockValue[i]);
} else {
newLockTime[j] = currentLockTime[i];
newLockValue[j] = currentLockValue[i];
j++;
}

i++;
}

  }
}

//#LOOPVARS: 
