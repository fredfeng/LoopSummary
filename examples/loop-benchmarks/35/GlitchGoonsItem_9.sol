
pragma solidity ^0.5.10;



contract C {
  

  uint256 blockNum;
uint32 TYPE_CHEST_WARRIOR;
uint32 TYPE_CHEST_WARLORD;
uint32 TYPE_CHEST_GLADIATOR;
uint256 _identifier;
uint32 TYPE_CHEST_APPRENTICE;
uint32 RARITY_LEGENDARY;
uint32 RARITY_RARE;
mapping(uint256 => ChestItem) chestItems;
uint i;

  function foo() public {
    
for(uint i = 0; i < 5; i++){
uint256 hash = uint256(keccak256(abi.encodePacked(_identifier, blockNum, i, block.coinbase, block.timestamp, block.difficulty)));
blockNum--;
uint256 rnd = hash % 101;
uint32 _tier;
uint32 _rarity;
uint256 _id;
if (isApprenticeChest(_identifier)) {
_id = getApprenticeDistributedRandom(rnd);
_rarity = getRarity(TYPE_CHEST_APPRENTICE, _id);
_tier = getTier(TYPE_CHEST_APPRENTICE, _id);
} else if (isWarriorChest(_identifier)) {
_id = getWarriorDistributedRandom(rnd);
_rarity = getRarity(TYPE_CHEST_WARRIOR, _id);
_tier = getTier(TYPE_CHEST_WARRIOR, _id);
} else if (isGladiatorChest(_identifier)) {
_id = getGladiatorDistributedRandom(rnd);
_rarity = getRarity(TYPE_CHEST_GLADIATOR, _id);
_tier = getTier(TYPE_CHEST_GLADIATOR, _id);
} else if (isWarlordChest(_identifier)) {
_id = getWarlordDistributedRandom(rnd);
_rarity = getRarity(TYPE_CHEST_WARLORD, _id);
_tier = getTier(TYPE_CHEST_WARLORD, _id);
} else {
require(false);
}




ChestItem chestItem = chestItems[hash % 8];
uint256 _region = ItemUtils.getRegion(_identifier);
uint256 _name = 1 + hash % 5;
if (i == 0) {
if (isWarriorChest(_identifier)) {
addItemToInternal(msg.sender, chestItem._class, chestItem._type, RARITY_RARE, 3, _name, _region);
} else if (isGladiatorChest(_identifier)) {
addItemToInternal(msg.sender, chestItem._class, chestItem._type, RARITY_RARE, 5, _name, _region);
} else if (isWarlordChest(_identifier)) {
addItemToInternal(msg.sender, chestItem._class, chestItem._type, RARITY_LEGENDARY, 5, _name, _region);
} else {
addItemToInternal(msg.sender, chestItem._class, chestItem._type, _rarity, _tier, _name, _region);
}



} else {
addItemToInternal(msg.sender, chestItem._class, chestItem._type, _rarity, _tier, _name, _region);
}

}


  }
}

//#LOOPVARS: i

contract ChestItem { }
