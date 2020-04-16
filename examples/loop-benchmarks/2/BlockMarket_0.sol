
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
Share[] shares;
address owner;
uint256 _initialPrice;
uint256 stockId;
uint8 _numShares;
mapping(uint256 => uint256[]) stockShares;

  function foo() public {
    
for(uint8 i = 0; i < _numShares; i++){
stockShares[stockId].push(shares.length);
shares.push(Share(owner, _initialPrice));
}


  }
}

//#LOOPVARS: i

contract Share { }
