
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint16[] Gate;
uint256 _incomingEthereum;
mapping(address => address) highlevel;
mapping(address => uint256) tokenBalance;
uint256 mintax;
mapping(address => uint256) commission;
address _highlevel;
uint256 tax_chain;
uint256 tax;
uint256 sumOftax;

  function foo() public {
    
for(i = 1; i <= 14; i++){
if (_highlevel == 0x0000000000000000000000000000000000000000 || tokenBalance[_highlevel] == 0) {
break;
}

uint8 com_rate = getCommissionRate(_highlevel);
tax_chain = ((tax_chain) * (com_rate)) / (10);
if (tokenBalance[_highlevel] >= Gate[2]) {
tax = mul_float_power(_incomingEthereum, i, com_rate, 10);
} else {
tax = tax_chain;
}

if (i > 2 && tax <= mintax) {
break;
}

commission[_highlevel] = (commission[_highlevel]) + (tax);
sumOftax = (sumOftax) + (tax);
_highlevel = highlevel[_highlevel];
emit taxOutput(tax, sumOftax);
}


  }
}

//#LOOPVARS: i
