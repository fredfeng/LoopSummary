






contract C {
  

  

  address[] addresses;
mapping(address => uint) dividends;
uint ethToDividendsNeeds;
uint PERCENT_RATE;
uint256 totalSupply;
uint percent;
uint count;
uint dividendsIndex;
mapping(address => uint256) balances;
uint invested;

  function foo() public {
    
for(uint i = 0; dividendsIndex < addresses.length && i < count; i++){
address tokenHolder = addresses[dividendsIndex];
if (balances[tokenHolder] != 0) {
uint valueInWei = ((((((((balances[tokenHolder]) * (invested))) * (percent))) / (PERCENT_RATE))) / (totalSupply));
ethToDividendsNeeds = ((ethToDividendsNeeds) + (valueInWei));
dividends[tokenHolder] = ((dividends[tokenHolder]) + (valueInWei));
}

dividendsIndex++;
}


  }

  

}

//#LOOPVARS: i


