
pragma solidity ^0.5.10;



contract C {
  

  uint dividendsPayedIndex;
mapping(address => uint) dividends;
address[] addresses;
mapping(address => bool) lockAddresses;
uint count;
uint ethToDividendsNeeds;
uint i;

  function foo() public {
    
for(uint i = 0; dividendsPayedIndex < addresses.length && i < count; i++){
address tokenHolder = addresses[dividendsPayedIndex];
if (!lockAddresses[tokenHolder] && dividends[tokenHolder] != 0) {
uint value = dividends[tokenHolder];
dividends[tokenHolder] = 0;
ethToDividendsNeeds = (ethToDividendsNeeds) - (value);
tokenHolder.transfer(value);
}

dividendsPayedIndex++;
}


  }
}

//#LOOPVARS: i
