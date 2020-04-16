
pragma solidity ^0.5.10;



contract C {
  

  uint256 decimals;
uint256 boughtKeys;
uint256 price;
uint256 _price;
uint256 _eth;
uint256 c_key;

  function foo() public {
    
while(true){
c_key = (c_key) + (1);
_price = price(c_key);
if (_price <= _eth) {
boughtKeys = (boughtKeys) + (decimals);
_eth = (_eth) - (_price);
} else {
boughtKeys = (boughtKeys) + ((_eth) * (decimals) / _price);
break;
}

}

  }
}

//#LOOPVARS: 
