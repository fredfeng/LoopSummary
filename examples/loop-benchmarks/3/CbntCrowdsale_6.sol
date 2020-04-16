
pragma solidity ^0.5.10;



contract C {
  

  address _beneficiary;
uint256 idx;
uint256 i;
FutureTransaction[] futureTrans;
uint256[] transList;

  function foo() public {
    
for(i = 0; i < futureTrans.length; i++){
if (futureTrans[i].beneficiary == _beneficiary) {
transList[idx] = i;
idx++;
}

}


  }
}

//#LOOPVARS: i

contract FutureTransaction { }
