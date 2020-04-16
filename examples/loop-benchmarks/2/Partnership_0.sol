
pragma solidity ^0.5.10;



contract C {
  

  Partner[] partners;
uint256 amount;
mapping(address => uint256) depositOf;
uint256 i;

  function foo() public {
    
for(uint256 i = 1; i < partners.length; i++){
if (partners[i].shares > 0) {
depositOf[partners[i].who] = (depositOf[partners[i].who]) + (((amount) * (partners[i].shares)) / (100));
}

}


  }
}

//#LOOPVARS: i

contract Partner { }
