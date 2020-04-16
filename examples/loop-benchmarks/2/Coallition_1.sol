
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) shares;
uint i;
uint256 total;
uint256 base;
mapping(uint256 => address) members;

  function foo() public {
    
for(i = 0; i < total; i++){
uint256 amounttotransfer = (base) * (shares[members[i]]);
members[i].transfer(amounttotransfer);
}


  }
}

//#LOOPVARS: i
