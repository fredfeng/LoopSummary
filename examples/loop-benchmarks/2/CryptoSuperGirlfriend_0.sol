
pragma solidity ^0.5.10;



contract C {
  

  uint256[] listedItems;
uint256 _itemId;
bool bExist;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < listedItems.length; i++){
if (listedItems[i] == _itemId) {
bExist = true;
break;
}

}


  }
}

//#LOOPVARS: i
