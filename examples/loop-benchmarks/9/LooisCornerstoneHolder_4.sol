
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
mapping(address => uint256) investorAmount;
uint8 releasePercent;
mapping(address => uint256) releasedAmount;
ERC20 token;
address[] investors;

  function foo() public {
    
for(uint8 i = 0; i < investors.length; i++){
address investor = investors[i];
uint256 amount = investorAmount[investor];
if (amount > 0) {
uint256 releaseAmount = ((amount) / (100)) * (releasePercent);
if ((releasedAmount[investor]) + (releaseAmount) > amount) {
releaseAmount = (amount) - (releasedAmount[investor]);
}

token.safeTransfer(investor, releaseAmount);
releasedAmount[investor] = (releasedAmount[investor]) + (releaseAmount);
emit Release(investor, releaseAmount);
}

}


  }
}

//#LOOPVARS: i

contract ERC20 { }
