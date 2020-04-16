
pragma solidity ^0.5.10;



contract C {
  

  LegalToken token;
uint teamBonusAllocatedTokens;
uint256 tokensSold;
uint i;
TeamBonus[] teamBonuses;

  function foo() public {
    
for(uint i = 0; i < teamBonuses.length; i++){
uint _teamBonusTokens = (((tokensSold) * (teamBonuses[i].tokenBps))) / (10000);
token.mint(this, _teamBonusTokens);
token.grantVestedTokens(teamBonuses[i].toAddress, _teamBonusTokens, uint64(now), teamBonuses[i].cliffDate, teamBonuses[i].vestingDate, false, false);
teamBonusAllocatedTokens = (teamBonusAllocatedTokens) + (_teamBonusTokens);
}


  }
}

//#LOOPVARS: i

contract LegalToken { }

contract TeamBonus { }
