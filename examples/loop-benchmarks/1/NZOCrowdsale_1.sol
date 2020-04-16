
pragma solidity ^0.5.10;



contract C {
  

  uint256 _currentDate;
uint numberWeeks;
uint j;
uint256 startTime;

  function foo() public {
    
for(uint j = 0; j < numberWeeks; j++){
if (startTime + 43 days + j * 7 days <= _currentDate && _currentDate <= startTime + 43 days + (j + 1) * 7 days) {
return j + 1;
}

}


  }
}

//#LOOPVARS: j
