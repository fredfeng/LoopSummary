
pragma solidity ^0.5.10;



contract C {
  

  address hl;
address[] playerList;
mapping(address => uint256) tokenBalance;
address[] highlevelList;
uint256 len;
uint256 i;
uint256 Profit;
uint[] ProfitList;
uint256 token;
uint[] tokenList;
mapping(address => address) highlevel;

  function foo() public {
    
for(i = 0; i < len; i++){
Profit = getTotalProfit(playerList[i]);
token = tokenBalance[playerList[i]];
hl = highlevel[playerList[i]];
ProfitList[i] = Profit;
tokenList[i] = token;
highlevelList[i] = hl;
}


  }
}

//#LOOPVARS: i
