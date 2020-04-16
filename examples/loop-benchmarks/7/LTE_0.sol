
pragma solidity ^0.5.10;



contract C {
  

  address[] _owners;
uint256[] _addrLockType;
uint256 topTotalSupply;
uint256 _totalSupply;
mapping(address => uint256) balances;
uint256[] _values;
uint decimals;
mapping(address => userToken) userReleaseToken;
uint i;

  function foo() public {
    
for(uint i = 0; i < _owners.length; i++){
uint256 value = _values[i] * 10 ** decimals;
require((_totalSupply) + (value) <= topTotalSupply);
_totalSupply = (_totalSupply) + (value);
balances[_owners[i]] = (balances[_owners[i]]) + (value);
emit Transfer(0x0, _owners[i], value);
userReleaseToken[_owners[i]].OCE = (userReleaseToken[_owners[i]].OCE) + (value);
userReleaseToken[_owners[i]].addrLockType = _addrLockType[i];
}


  }
}

//#LOOPVARS: i

contract userToken { }
