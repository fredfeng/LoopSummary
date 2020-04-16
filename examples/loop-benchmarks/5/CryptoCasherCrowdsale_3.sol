
pragma solidity ^0.5.10;



contract C {
  

  address addressFundNonKYCReserv;
address[] _recipients;
uint j;
IContractErc20Token tokenContract;
uint256[] _values;
mapping(address => uint256) paidTokens;

  function foo() public {
    
for(uint j = 0; j < _recipients.length; j++){
require(0 <= _values[j]);
require(_values[j] <= paidTokens[_recipients[j]]);
(paidTokens[_recipients[j]]) - (_values[j]);
tokenContract.transferFrom(addressFundNonKYCReserv, _recipients[j], _values[j]);
emit Transfer(msg.sender, _recipients[j], _values[j]);
}


  }
}

//#LOOPVARS: j

contract IContractErc20Token { }
