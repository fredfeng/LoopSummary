
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _amounts;
address[] _receivers;
uint256 i;
uint256 excessTokens;
uint256 amount;
address receiver;
OrcaToken token;

  function foo() public {
    
for(uint256 i = 0; i < _receivers.length; i++){
receiver = _receivers[i];
amount = _amounts[i];
require(receiver != address(0));
require(amount > 0);
excessTokens = updateStageCap(amount);
uint256 tokens = (amount) - (excessTokens);
token.mint(receiver, tokens, '');
if (excessTokens > 0) {
emit ManualTokenMintRequiresRefund(receiver, excessTokens);
}

}


  }
}

//#LOOPVARS: i

contract OrcaToken { }
