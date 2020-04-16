
pragma solidity ^0.5.10;



contract C {
  

  bytes32 _idByte;
mapping(bytes32 => RandomBoxStruct) randomBoxes;
mapping(address => RandomItemStruct) randomItems;
uint _count;
uint i;

  function foo() public {
    
for(uint i = 0; i < _count; i++){
uint randomVal = uint(keccak256(blockhash(block.number - 1), randomItems[msg.sender].values[_idByte].length)) % randomBoxes[_idByte].volume;
randomItems[msg.sender].values[_idByte].push(randomVal);
}


  }
}

//#LOOPVARS: i

contract RandomItemStruct { }

contract RandomBoxStruct { }
