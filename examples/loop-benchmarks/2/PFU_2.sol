
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) lockNum;
address _address;
uint256 i;
uint256 _balance;
mapping(address => uint256[]) lockValue;

  function foo() public {
    
while(i < lockNum[_address]){
_balance = (_balance) + (lockValue[_address][i]);
i++;
}

  }
}

//#LOOPVARS: 
