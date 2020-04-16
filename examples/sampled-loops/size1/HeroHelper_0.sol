
pragma solidity ^0.5.10;



contract C {
  

  uint32[] hero_ids;
uint256 start_index;
address target;
uint256 i;
AbstractDatabase m_Database;
uint256 end;
uint256 InventoryHeroCategory;

  function foo() public {
    
for(uint256 i = start_index; i < end; i++){
hero_ids[i - start_index] = uint32(uint256(m_Database.Load(target, InventoryHeroCategory, (i) + (1))));
}


  }
}

//#LOOPVARS: i

contract AbstractDatabase { }
