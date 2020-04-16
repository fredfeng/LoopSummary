
pragma solidity ^0.5.10;



contract C {
  

  uint256 num;
address _beneficiary;
FutureTransaction[] futureTrans;
uint256 i;

  function foo() public {
    
for(i = 0; i < futureTrans.length; i++){
if (futureTrans[i].beneficiary == _beneficiary) {
num++;
}

}


  }
}

//#LOOPVARS: i

contract FutureTransaction { }
