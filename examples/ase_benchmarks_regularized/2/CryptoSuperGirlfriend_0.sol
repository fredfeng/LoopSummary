






contract C {
  

  

  uint256[] listedItems;
uint256 _itemId;
bool bExist;

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


