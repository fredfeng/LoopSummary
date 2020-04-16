
pragma solidity ^0.5.10;



contract C {
  

  uint256 earlier;
mapping(address => uint256[]) lockTime;
mapping(address => uint256) lockNum;
address _address;
uint256 i;
uint256 _balance;
mapping(address => uint256[]) lockValue;
uint256 later;

  function foo() public {
    
while(i < lockNum[_address]){
if ((now) + (earlier) >= (lockTime[_address][i]) + (later)) _balance = (_balance) + (lockValue[_address][i]);

i++;
}

  }
}

//#LOOPVARS: 
