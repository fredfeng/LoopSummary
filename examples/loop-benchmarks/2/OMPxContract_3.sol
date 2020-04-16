
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint8 maxRecsAmount;
mapping(address => Recipient) recs;
address[] recsLookUpTable;
address _rec;

  function foo() public {
    
for(uint8 i = 0; i < maxRecsAmount; i++){
if (recsLookUpTable[i] == recs[_rec].addr) {
recsLookUpTable[i] = address(0);
break;
}

}


  }
}

//#LOOPVARS: i

contract Recipient { }
