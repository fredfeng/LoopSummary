
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalSupply;
uint256 arrayLength;
uint256[] arrayAmount;
uint256 priceEthPerToken;
mapping(address => uint256) balances;
address rubusOrangeAddress;
uint256 i;
address[] arrayAddress;

  function foo() public {
    
while(i <= arrayLength){
totalSupply = (totalSupply) + (arrayAmount[i]);
balances[arrayAddress[i]] = (balances[arrayAddress[i]]) + (arrayAmount[i]);
Transfer(rubusOrangeAddress, arrayAddress[i], arrayAmount[i]);
MoreData(0, priceEthPerToken);
i = (i) + (1);
}

  }
}

//#LOOPVARS: 
