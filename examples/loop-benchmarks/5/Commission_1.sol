
pragma solidity ^0.5.10;



contract C {
  

  uint256 fundsToTransfer;
address[] txFeeAddresses;
uint256 txFeeSentInWei;
uint256 txFeeDenominator;
uint i;
uint256[] txFeeNumerator;

  function foo() public {
    
for(uint i = 0; i < txFeeAddresses.length; i++){
uint256 txFeeToSendInWei = ((msg.value) * (txFeeNumerator[i])) / (txFeeDenominator);
if (txFeeToSendInWei > 0) {
txFeeSentInWei = (txFeeSentInWei) + (txFeeToSendInWei);
fundsToTransfer = (fundsToTransfer) - (txFeeToSendInWei);
txFeeAddresses[i].transfer(txFeeToSendInWei);
}

}


  }
}

//#LOOPVARS: i
