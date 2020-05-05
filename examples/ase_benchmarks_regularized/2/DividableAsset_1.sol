






contract C {
  

  

  address[] _address;
mapping(address => uint) balances;
uint length;
mapping(address => uint) indexOfowner;
uint total_amount;
uint collectPrice;

  function foo() public {
    
for(uint j = 0; j < length; j++){
if (indexOfowner[_address[j]] == 0) {
continue;
}

total_amount = ((total_amount) + (((collectPrice) * (balances[_address[j]]))));
}


  }

  

}

//#LOOPVARS: j


