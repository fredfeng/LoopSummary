






contract C {
  

  

  address[] recsLookUpTable;
uint8 maxRecsAmount;
address _rec;

  function foo() public {
    
for(uint8 i = 0; i < maxRecsAmount; i++){
if (recsLookUpTable[i] == address(0)) {
recsLookUpTable[i] = _rec;
break;
}

}


  }

  

}

//#LOOPVARS: i


