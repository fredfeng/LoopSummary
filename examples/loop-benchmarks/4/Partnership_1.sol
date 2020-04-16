
pragma solidity ^0.5.10;



contract C {
  

  Partner[] partners;
uint256 partnerIndex;
uint256 sharesSupply;
address _who;
uint256 i;

  function foo() public {
    
for(uint256 i = 1; i < partners.length; i++){
if (partners[i].who == _who) {
partnerIndex = i;
} else if (partners[i].shares > 0) {
sharesSupply = (sharesSupply) - (partners[i].shares);
}


}


  }
}

//#LOOPVARS: i

contract Partner { }
