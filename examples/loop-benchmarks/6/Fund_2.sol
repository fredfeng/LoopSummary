
pragma solidity ^0.5.10;



contract C {
  

  uint256[] outcomes;
address _beneficiary;
uint16 totalChances;
uint16[] chances;
uint256 _numberOfTokens;
Fund fund;
uint16 i;

  function foo() public {
    
for(uint16 i = 1; i <= _numberOfTokens; i++){
uint256 randomNumber = uint256(keccak256(block.blockhash(block.number - 1))) % totalChances;
uint8 rateIndex = getRateIndex(randomNumber);
assert(chances[rateIndex] != 0);
chances[rateIndex]--;
uint256 amount = outcomes[rateIndex];
fund.mint(_beneficiary, amount);
}


  }
}

//#LOOPVARS: i

contract Fund { }
