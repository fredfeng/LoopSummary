
pragma solidity ^0.5.10;



contract C {
  

  uint256 _boughtTokens;
uint256 soldOnStage;
uint256 undistributedAmount;
uint256 stageBoughtTokens;
uint256 undistributedTokens;

  function foo() public {
    
while(undistributedAmount > 0 && undistributedTokens > 0){
bool needNextStage = false;
stageBoughtTokens = getTokensAmount(undistributedAmount);
if (stageBoughtTokens > availableOnStage()) {
stageBoughtTokens = availableOnStage();
needNextStage = true;
}

_boughtTokens = (_boughtTokens) + (stageBoughtTokens);
undistributedTokens = (undistributedTokens) - (stageBoughtTokens);
undistributedAmount = (undistributedAmount) - (getTokensCost(stageBoughtTokens));
soldOnStage = (soldOnStage) + (stageBoughtTokens);
if (needNextStage) toNextStage();

}

  }
}

//#LOOPVARS: 
