
pragma solidity ^0.5.10;



contract C {
  

  TransferQueue t;
ERC20 tokenTrueUSD;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < t.destinations.length; i++){
tokenTrueUSD.transfer(t.destinations[i], t.balances[t.destinations[i]]);
emit PayoutProcessed(t.destinations[i], t.balances[t.destinations[i]], t.kind[t.destinations[i]]);
}


  }
}

//#LOOPVARS: i

contract TransferQueue { }

contract ERC20 { }
