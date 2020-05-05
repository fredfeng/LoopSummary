






contract C {
  

  

  mapping(uint => uint) products_price;
uint256[] price;
uint256 counter;

  function foo() public {
    
for(uint i = 0; i < counter; i++){
price[i] = products_price[i + 1];
}


  }

  

}

//#LOOPVARS: i


