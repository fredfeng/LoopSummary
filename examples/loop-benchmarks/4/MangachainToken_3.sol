
pragma solidity ^0.5.10;



contract C {
  

  address depositAddress;
mapping(address => uint256) unlockUnixTime;
mapping(address => uint256) balanceOf;
address[] _targets;
uint256 totalAmount;
uint i;

  function foo() public {
    
for(uint i = 0; i < _targets.length; i++){
require(_targets[i] != 0x0 && now > unlockUnixTime[_targets[i]]);
totalAmount = (totalAmount) + (balanceOf[_targets[i]]);
Transfer(_targets[i], depositAddress, balanceOf[_targets[i]]);
balanceOf[_targets[i]] = 0;
}


  }
}

//#LOOPVARS: i
