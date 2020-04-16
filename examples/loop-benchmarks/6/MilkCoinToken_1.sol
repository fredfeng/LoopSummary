
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalSupply;
mapping(address => uint256) balances;
mapping(address => uint) dividends;
address[] addresses;
uint count;
uint percent;
uint invested;
uint PERCENT_RATE;
uint ethToDividendsNeeds;
uint i;
uint dividendsIndex;

  function foo() public {
    
for(uint i = 0; dividendsIndex < addresses.length && i < count; i++){
address tokenHolder = addresses[dividendsIndex];
if (balances[tokenHolder] != 0) {
uint valueInWei = ((((balances[tokenHolder]) * (invested)) * (percent)) / (PERCENT_RATE)) / (totalSupply);
ethToDividendsNeeds = (ethToDividendsNeeds) + (valueInWei);
dividends[tokenHolder] = (dividends[tokenHolder]) + (valueInWei);
}

dividendsIndex++;
}


  }
}

//#LOOPVARS: i
