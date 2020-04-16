
pragma solidity ^0.5.10;



contract C {
  

  uint256 i;
mapping(address => uint256) creditOf;
MintableToken token;
address[] investors;
BitNauticWhitelist whitelist;

  function foo() public {
    
for(uint256 i = 0; i < investors.length; i++){
if (creditOf[investors[i]] > 0 && whitelist.AMLWhitelisted(investors[i])) {
token.mint(investors[i], creditOf[investors[i]]);
creditOf[investors[i]] = 0;
}

}


  }
}

//#LOOPVARS: i

contract MintableToken { }

contract BitNauticWhitelist { }
