
pragma solidity ^0.5.10;



contract C {
  

  address[] whitelistAddresses;
uint y;
uint len;
address[] tmp;
uint256 _tier;
mapping(address => uint256) _whitelistTier;
uint i;

  function foo() public {
    
for(uint i = 0; i < len; i++){
if (_whitelistTier[whitelistAddresses[i]] == _tier) {
tmp[y] = whitelistAddresses[i];
y++;
}

}


  }
}

//#LOOPVARS: i
