
pragma solidity ^0.5.10;



contract C {
  

  address _from;
mapping(address => bool) airdrops;
address[] _recipient;
uint256 i;
uint airdropped;
uint tokens;
token tokenReward;

  function foo() public {
    
for(uint256 i = 0; i < _recipient.length; i++){
if (!airdrops[_recipient[i]]) {
airdrops[_recipient[i]] = true;
require(tokenReward.transferFrom(_from, _recipient[i], tokens));
airdropped = (airdropped) + (tokens);
}

}


  }
}

//#LOOPVARS: i

contract token { }
