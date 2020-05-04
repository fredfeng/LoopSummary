






contract C {
  

  

  address[] Token_Purchaser;
mapping(address => uint256) Eth_weight;

  function foo() public {
    
for(uint i = 0; i < Token_Purchaser.length; i++){
if (Eth_weight[Token_Purchaser[i]] == 0) {
delete Token_Purchaser[i];
}

}


  }

  

}

//#LOOPVARS: i


