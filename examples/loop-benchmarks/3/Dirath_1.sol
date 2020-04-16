
pragma solidity ^0.5.10;



contract C {
  

  uint256 dividendsPerToken;
itMaps.itMapAddressUint balances;
uint256 i;
mapping(address => uint256) approvedDividends;

  function foo() public {
    
for(uint256 i = 0; i < balances.size(); i += 1){
address tokenHolder = balances.getKeyByIndex(i);
if (balances.get(tokenHolder) > 0) approvedDividends[tokenHolder] = balances.get(tokenHolder) * dividendsPerToken;

}


  }
}

//#LOOPVARS: i

contract itMaps.itMapAddressUint { }
