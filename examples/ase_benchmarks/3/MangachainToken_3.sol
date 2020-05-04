






contract C {
  

  

  address depositAddress;
mapping(address => uint256) unlockUnixTime;
mapping(address => uint256) balanceOf;
address[] _targets;
uint256 totalAmount;

  function foo() public {
    
for(uint i = 0; i < _targets.length; i++){
require(_targets[i] != 0x0 && now > unlockUnixTime[_targets[i]]);
totalAmount = ((totalAmount) + (balanceOf[_targets[i]]));

balanceOf[_targets[i]] = 0;
}


  }

  

}

//#LOOPVARS: i


