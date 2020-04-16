
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _amounts;
address[] _receivers;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _receivers.length; i++){
address receiver = _receivers[i];
uint256 amount = _amounts[i];
require(receiver != address(0));
require(amount > 0);
uint256 excess = appendContribution(receiver, amount);
if (excess > 0) {
ManualTokenMintRequiresRefund(receiver, excess);
}

}


  }
}

//#LOOPVARS: i
