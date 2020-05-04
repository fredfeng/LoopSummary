






contract C {
  

  

  uint256 _tier;
address[] tmp;
mapping(address => uint256) _whitelistTier;
address[] whitelistAddresses;
uint y;
uint len;

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


