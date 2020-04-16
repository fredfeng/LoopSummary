
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint8 maxRecsAmount;
mapping(address => Recipient) recs;
address[] recsLookUpTable;
uint256 sharesSum;

  function foo() public {
    
for(uint8 i = 0; i < maxRecsAmount; i++){
Recipient rec = recs[recsLookUpTable[i]];
uint ethAmount = (((rec.share) * (msg.value))) / (sharesSum);
rec.balance = rec.balance + ethAmount;
}


  }
}

//#LOOPVARS: i

contract Recipient { }
