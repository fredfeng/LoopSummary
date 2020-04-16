
pragma solidity ^0.5.10;



contract C {
  

  bool bRemove;
uint32 regularTime;
uint256 i;
uint256 beginIdx;
FutureTransaction[] futureTrans;
uint256 endIdx;
uint256 oweCbnt;
uint32 transTimes;

  function foo() public {
    
for(i = beginIdx; i <= endIdx && i < futureTrans.length; ){
bRemove = false;
if (futureTrans[i].lastTime < regularTime) {
uint256 transNum = futureTrans[i].num;
address beneficiary = futureTrans[i].beneficiary;
futureTrans[i].lastTime = now;
futureTrans[i].times = futureTrans[i].times - 1;
require(futureTrans[i].times <= transTimes);
if (futureTrans[i].times == 0) {
bRemove = true;
futureTrans[i].beneficiary = futureTrans[futureTrans.length - 1].beneficiary;
futureTrans[i].num = futureTrans[futureTrans.length - 1].num;
futureTrans[i].lastTime = futureTrans[futureTrans.length - 1].lastTime;
futureTrans[i].times = futureTrans[futureTrans.length - 1].times;
futureTrans.length = (futureTrans.length) - (1);
}

oweCbnt = (oweCbnt) - (transNum);
_deliverTokens(beneficiary, transNum);
}

if (!bRemove) {
i++;
}

}


  }
}

//#LOOPVARS: i

contract FutureTransaction { }
