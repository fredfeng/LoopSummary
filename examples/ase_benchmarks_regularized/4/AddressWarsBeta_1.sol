






contract C {
  

  

  uint256 cumulativeTotal;
uint256[] array;
bool hasFound;
uint256 index;
uint256 target;

  function foo() public {
    
for(uint256 i = 0; i < array.length; i++){
cumulativeTotal += array[i];
if (cumulativeTotal > target) {
hasFound = true;
index = i;
break;
}

}


  }

  

}

//#LOOPVARS: i


