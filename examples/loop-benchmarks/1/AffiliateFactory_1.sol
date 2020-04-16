
pragma solidity ^0.5.10;



contract C {
  

  Share[] shares;
uint balance;
ERC20 token;
uint j;
uint totalShares;

  function foo() public {
    
for(uint j = 0; j < shares.length; j++){
token.transfer(shares[j].shareholder, SafeMath.mul(balance, shares[j].stake) / totalShares);
}


  }
}

//#LOOPVARS: j

contract Share { }

contract ERC20 { }
