
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint[]) ownerToPixel;
address _from;
uint i;
uint _pixelId;

  function foo() public {
    
for(uint i = 0; i < ownerToPixel[_from].length; i++){
if (ownerToPixel[_from][i] == _pixelId) {
ownerToPixel[_from][i] = ownerToPixel[_from][ownerToPixel[_from].length - 1];
delete ownerToPixel[_from][ownerToPixel[_from].length - 1];
}

}


  }
}

//#LOOPVARS: i
