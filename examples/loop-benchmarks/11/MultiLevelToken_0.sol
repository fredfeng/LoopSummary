
pragma solidity ^0.5.10;



contract C {
  

  uint tier;
address whom;
uint parent;
mapping(uint => mapping(uint => address)) order;
uint256 parentMoney;
MultiLevelToken token;

  function foo() public {
    
while(parent > 1){
if (parent % 3 == 0) {
parent = (parent) / (3);
whom = order[tier][parent];
token.mint(whom, parentMoney);
} else if ((parent - 1) % 3 == 0) {
parent = (parent - 1) / 3;
whom = order[tier][parent];
token.mint(whom, parentMoney);
} else {
parent = (parent + 1) / 3;
whom = order[tier][parent];
token.mint(whom, parentMoney);
}


}

  }
}

//#LOOPVARS: 

contract MultiLevelToken { }

contract uint => mappinguint { }
