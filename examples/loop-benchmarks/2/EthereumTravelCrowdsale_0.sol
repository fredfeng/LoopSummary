
pragma solidity ^0.5.10;



contract C {
  

  TokenInterface token;
address[] usersAddressForPreICO;
uint256 weiRaisedInPreICO;
mapping(address => uint) EthSentAgainstAddress;
uint i;

  function foo() public {
    
for(uint i = 0; i < usersAddressForPreICO.length; i++){
uint tks = (((EthSentAgainstAddress[usersAddressForPreICO[i]]) * (1000000000 * 10 ** 18))) / (weiRaisedInPreICO);
token.transfer(usersAddressForPreICO[i], tks);
}


  }
}

//#LOOPVARS: i

contract TokenInterface { }
