
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => mapping(address => bool)) whitelist;
FundingRound[] roundPrices;
uint i;
uint rate;

  function foo() public {
    
for(uint i = 0; i < roundPrices.length; i++){
if (now > roundPrices[i].startTime && now < roundPrices[i].endTime) {
rate = roundPrices[i].rate;
if (roundPrices[i].hasWhitelist == true) {
require(whitelist[i][msg.sender] == true);
}

}

}


  }
}

//#LOOPVARS: i

contract uint => mappingaddress { }

contract FundingRound { }
