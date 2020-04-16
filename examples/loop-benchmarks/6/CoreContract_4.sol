
pragma solidity ^0.5.10;



contract C {
  

  bool parentExists;
uint256 _parentId;
uint256 DEFAULTPARENT;
uint256 length;
TokenLayer layer;
address _parentAddr;

  function foo() public {
    
while((_parentId != DEFAULTPARENT) && _addressNotNull(_parentAddr) && parentExists){
parentExists = layer.exists(_parentId);
if (!parentExists) {
return (length);
}

_parentId = layer.getParentOf(_parentId);
_parentAddr = layer.parentAddr();
layer = TokenLayer(_parentAddr);
length++;
}

  }
}

//#LOOPVARS: 

contract TokenLayer { }
