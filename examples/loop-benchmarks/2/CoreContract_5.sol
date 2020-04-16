
pragma solidity ^0.5.10;



contract C {
  

  uint256 _price;
address[] _owners;
uint256[] _chainFees;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < 10; i++){
if (_addressNotNull(_owners[i])) {
_owners[i].transfer(((_price) * (_chainFees[i])) / (1000));
}

}


  }
}

//#LOOPVARS: i
