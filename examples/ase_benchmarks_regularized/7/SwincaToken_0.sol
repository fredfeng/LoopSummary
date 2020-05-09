






contract C {
  

  

  uint256 _n;
uint256 balancesBookingArrayLength;
address[] balancesBookingArray;
mapping(address => uint256) balancesBooking;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint256 i = balancesBookingArray.length; i >= balancesBookingArrayLength - _n + 1; i--){
uint256 j = i - 1;
address _to = balancesBookingArray[j];
uint256 _value = balancesBooking[_to];
balances[msg.sender] = ((balances[msg.sender]) - (_value));
balances[_to] = ((balances[_to]) + (_value));
balancesBooking[_to] = 0;
balancesBookingArray.length--;

}


  }

  

}

//#LOOPVARS: i


