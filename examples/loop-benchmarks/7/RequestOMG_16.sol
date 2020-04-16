
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
mapping(bytes32 => address[]) payeesPaymentAddress;
uint256[] _payeeAmounts;
RequestCore requestCore;
bytes32 _requestId;

  function foo() public {
    
for(uint8 i = 0; i < _payeeAmounts.length; i = (i) + (1)){
if (_payeeAmounts[i] != 0) {
requestCore.updateBalance(_requestId, i, _payeeAmounts[i].toInt256Safe());
address addressToPay;
if (payeesPaymentAddress[_requestId][i] == 0) {
addressToPay = requestCore.getPayeeAddress(_requestId, i);
} else {
addressToPay = payeesPaymentAddress[_requestId][i];
}

fundOrderInternal(msg.sender, addressToPay, _payeeAmounts[i]);
}

}


  }
}

//#LOOPVARS: i

contract RequestCore { }
