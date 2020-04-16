
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => User) bounties;
mapping(address => bool) signups;
address[] bountyaddress;
uint256 i;
uint256[] _amount;
uint userSignupCount;
uint maxSignup;
address[] _userlist;

  function foo() public {
    
for(uint256 i = 0; i < _userlist.length; i++){
address baddr = _userlist[i];
uint256 bval = _amount[i];
if (baddr != address(0)) {
if (bounties[baddr].user_address == baddr) {
bounties[baddr].reward_amount = bval;
} else {
if (userSignupCount <= maxSignup) {
bounties[baddr] = User(baddr, now, bval, false, 0, 0, true);
signups[baddr] = true;
bountyaddress.push(baddr) - 1;
userSignupCount++;
}

}

}

}


  }
}

//#LOOPVARS: i

contract User { }
