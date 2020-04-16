
pragma solidity ^0.5.10;



contract C {
  

  uint t;
uint freezeAmount;
uint i;
BalanceInfo bi;

  function foo() public {
    
for(uint i = 0; i < bi.freezeAmount.length; i++){
if (t < bi.releaseTime[i]) freezeAmount += bi.freezeAmount[i];

}


  }
}

//#LOOPVARS: i

contract BalanceInfo { }
