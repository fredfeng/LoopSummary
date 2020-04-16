
pragma solidity ^0.5.10;



contract C {
  

  address[] tokens;
uint i;

  function foo() public {
    
for(uint i = 0; i < tokens.length; i++){
ERC20 token = ERC20(tokens[i]);
uint balance = token.balanceOf(this);
for (uint j = 0; j < shares.length; j++) {
token.transfer(shares[j].shareholder, SafeMath.mul(balance, shares[j].stake) / totalShares);
}

emit Payout(tokens[i], balance);
}


  }
}

//#LOOPVARS: i

contract ERC20 { }
