
pragma solidity ^0.5.10;



contract C {
  

  uint256 earlier;
mapping(address => uint256[]) lockTime;
mapping(address => uint256) lockNum;
address _address;
uint i;
uint256 later;
uint256[] tempLockTime;

  function foo() public {
    
while(i < lockNum[_address]){
tempLockTime[i] = ((lockTime[_address][i]) + (later)) - (earlier);
i++;
}

  }
}

//#LOOPVARS: 
