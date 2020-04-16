
pragma solidity ^0.5.10;



contract C {
  

  uint256 i;
uint256 amount;
mapping(address => uint256) depositOf;
Member[] members;

  function foo() public {
    
for(uint256 i = 1; i < members.length; i++){
if (members[i].shares > 0) {
depositOf[members[i].who] = (depositOf[members[i].who]) + (((amount) * (members[i].shares)) / (100));
}

}


  }
}

//#LOOPVARS: i

contract Member { }
