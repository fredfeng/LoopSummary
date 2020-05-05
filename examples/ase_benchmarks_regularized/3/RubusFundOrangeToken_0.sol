






contract C {
  

  

  uint256 i;
uint256 arrayLength;
address rubusOrangeAddress;
address[] arrayAddress;
uint256 totalSupply;
uint256 priceEthPerToken;
uint256[] arrayAmount;
mapping(address => uint256) balances;

  function foo() public {
    
while(i <= arrayLength){
totalSupply = ((totalSupply) + (arrayAmount[i]));
balances[arrayAddress[i]] = ((balances[arrayAddress[i]]) + (arrayAmount[i]));


i = ((i) + (1));
}

  }

  

}

//#LOOPVARS: i


