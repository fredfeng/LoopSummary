
pragma solidity ^0.5.10;



contract C {
  

  itMaps.itMapAddressUint tokenBalances;
uint i;
uint tokensForEachMember;
mapping(uint => address) teamAddresses;

  function foo() public {
    
for(uint i = 0; i < 5; i += 1){
address teamMember = teamAddresses[i];
if (!tokenBalances.contains(teamMember)) tokenBalances.insert(teamMember, tokensForEachMember); else (tokenBalances.insert(teamMember, tokenBalances.get(teamMember) + tokensForEachMember));

emit Transfer(address(this), teamMember, tokensForEachMember);
}


  }
}

//#LOOPVARS: i

contract itMaps.itMapAddressUint { }
