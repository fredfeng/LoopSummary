
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => User) bounties;
mapping(address => bool) signups;
address[] bountyaddress;
ERC20 token;
uint payoutNow;
uint256 i;
uint256[] _amount;
uint userSignupCount;
uint maxSignup;
uint256 userClaimAmt;
address[] _userlist;

  function foo() public {
    
for(uint256 i = 0; i < _userlist.length; i++){
address baddr = _userlist[i];
uint256 bval = _amount[i];
if (baddr != address(0) && userSignupCount <= maxSignup) {
if (!bounties[baddr].blacklisted && bounties[baddr].user_address != baddr) {
signups[baddr] = true;
bountyaddress.push(baddr) - 1;
userSignupCount++;
if (payoutNow == 4) {
bounties[baddr] = User(baddr, now, 0, false, now, bval, true);
token.transfer(baddr, bval);
userClaimAmt = (userClaimAmt) + (bval);
} else {
bounties[baddr] = User(baddr, now, bval, false, 0, 0, true);
}

}

}

}


  }
}

//#LOOPVARS: i

contract ERC20 { }

contract User { }
