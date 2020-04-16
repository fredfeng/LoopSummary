
pragma solidity ^0.5.10;



contract C {
  

  uint8[] _R;
uint8[] _G;
uint8[] _B;
uint totalPrice;
string _text;
address newOwner;
uint excessValue;
uint i;
uint32[] _Id;

  function foo() public {
    
for(uint i = 0; i < _Id.length; i++){
address oldOwner = ownerOf(_Id[i]);
require(ownerOf(_Id[i]) != newOwner);
require(!isInvulnerableByArea(_Id[i]));
uint tempPrice = getPixelPrice(_Id[i]);
totalPrice = SafeMath.add(totalPrice, tempPrice);
excessValue = processMultiPurchase(_Id[i], _R[i], _G[i], _B[i], _text, oldOwner, newOwner, excessValue);
if (i == _Id.length - 1) {
require(msg.value >= totalPrice);
msg.sender.transfer(excessValue);
}

}


  }
}

//#LOOPVARS: i

contract string { }
