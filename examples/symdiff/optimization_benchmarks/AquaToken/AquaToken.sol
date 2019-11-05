pragma solidity ^0.5.10;

contract C {

  uint fromRewardIdx;
  uint toRewardIdx;
  uint updatedBalance;
  uint holding_totalTokens;
  uint [] rewards;
  
  function foo() internal returns (uint) {
  /* function calcFullWeiBalance(LibHoldings.Holding storage holding, uint maxSteps) internal */
  /*   constant */
  /*   returns(uint updatedBalance, uint stepsMade) { */
    for(uint idx = fromRewardIdx; 
	idx <= toRewardIdx; 
	/* idx = idx.add(1)) { */
	idx += 1) {
      /* updatedBalance = updatedBalance.add(  */
      /* 					  rewards[idx].mul( holding.totalTokens )  */
      /* 					   ); */
      updatedBalance += rewards[idx]*holding_totalTokens;
    }

    return updatedBalance;
  }    
}
