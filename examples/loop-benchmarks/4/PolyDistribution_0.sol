
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) airdrops;
address[] _recipient;
uint256 i;
uint airdropped;
uint256 decimalFactor;
PolyToken POLY;

  function foo() public {
    
for(uint256 i = 0; i < _recipient.length; i++){
if (!airdrops[_recipient[i]]) {
airdrops[_recipient[i]] = true;
require(POLY.transfer(_recipient[i], 250 * decimalFactor));
airdropped = (airdropped) + (250 * decimalFactor);
}

}


  }
}

//#LOOPVARS: i

contract PolyToken { }
