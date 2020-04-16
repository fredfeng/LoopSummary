
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
mapping(bytes32 => Payee[]) subPayees;
uint8 payeesCount;
bytes _data;
bytes32 requestId;

  function foo() public {
    
for(uint8 i = 1; i < payeesCount; i = (i) + (1)){
address subPayeeAddress = extractAddress(_data, ((uint256(i)) * (52)) + (41));
require(subPayeeAddress != 0, "subpayee should not be 0");
subPayees[requestId][i - 1] = Payee(subPayeeAddress, int256(extractBytes32(_data, ((uint256(i)) * (52)) + (61))), 0);
emit NewSubPayee(requestId, subPayeeAddress);
}


  }
}

//#LOOPVARS: i

contract Payee { }
