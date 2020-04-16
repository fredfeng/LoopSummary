
pragma solidity ^0.5.10;



contract C {
  

  itMaps.itMapAddressUint balances;
uint256 i;
mapping(address => uint256) approvedDividends;

  function foo() public {
    
for(uint256 i = 0; i < balances.size(); i += 1){
address tokenHolder = balances.getKeyByIndex(i);
if (approvedDividends[tokenHolder] > 0) {
tokenHolder.transfer(approvedDividends[tokenHolder]);
DividendsTransfered(tokenHolder, approvedDividends[tokenHolder]);
approvedDividends[tokenHolder] = 0;
}

}


  }
}

//#LOOPVARS: i

contract itMaps.itMapAddressUint { }
