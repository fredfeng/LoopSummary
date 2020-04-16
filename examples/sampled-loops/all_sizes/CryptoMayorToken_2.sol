
pragma solidity ^0.5.10;



contract C {
  

  OldContract oldContract;
uint256[] _ids;
mapping(uint256 => Token) tokens;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _ids.length; i++){
if (tokens[_ids[i]].price == 0) {
address _owner;
uint256 _price;
uint256 _lastPrice;
uint256 _nextPrice;
uint256 _payout;
uint8 _kind;
uint256 _mayorTokenId;
(_owner, _price, _lastPrice, _nextPrice, _payout, _kind, _mayorTokenId) = oldContract.getToken(_ids[i]);
createToken(_ids[i], _price, _lastPrice, _payout, _kind, _mayorTokenId, _owner);
}

}


  }
}

//#LOOPVARS: i

contract OldContract { }

contract Token { }
