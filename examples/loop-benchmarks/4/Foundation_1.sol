
pragma solidity ^0.5.10;



contract C {
  

  uint256 sharesSupply;
address _who;
uint256 memberIndex;
uint256 i;
Member[] members;

  function foo() public {
    
for(uint256 i = 1; i < members.length; i++){
if (members[i].who == _who) {
memberIndex = i;
} else if (members[i].shares > 0) {
sharesSupply = (sharesSupply) - (members[i].shares);
}


}


  }
}

//#LOOPVARS: i

contract Member { }
