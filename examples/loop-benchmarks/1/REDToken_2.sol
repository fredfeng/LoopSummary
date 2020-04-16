
pragma solidity ^0.5.10;



contract C {
  

  address[] _batchOfAddresses;
uint[] _amountOfRED;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _batchOfAddresses.length; i++){
deliverAngelsREDBalance(_batchOfAddresses[i], _amountOfRED[i]);
}


  }
}

//#LOOPVARS: i
