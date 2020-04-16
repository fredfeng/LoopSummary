
pragma solidity ^0.5.10;



contract C {
  

  address _to;
address[] tokens;
uint i;

  function foo() public {
    
for(uint i = 0; i < tokens.length; i++){
address token = tokens[i];
uint balance = ERC20Interface(token).balanceOf(this);
if (balance != 0) ERC20Interface(token).transfer(_to, balance);

}


  }
}

//#LOOPVARS: i
