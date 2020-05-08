






contract C {
  

  

  uint256[] newLockTime;
mapping(address => uint256) lockNum;
uint256 earlier;
mapping(address => uint256) balanceP;
uint256 i;
uint256[] currentLockValue;
uint256 j;
uint256 later;
uint256[] currentLockTime;
uint256[] newLockValue;
address _address;

  function foo() public {
    
while(i < lockNum[_address]){
if (((now) + (earlier)) >= ((currentLockTime[i]) + (later))) {
balanceP[_address] = ((balanceP[_address]) + (currentLockValue[i]));

} else {
newLockTime[j] = currentLockTime[i];
newLockValue[j] = currentLockValue[i];
j++;
}

i++;
}

  }

  

}

//#LOOPVARS: i


