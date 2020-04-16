
pragma solidity ^0.5.10;



contract C {
  

  address[] investors;
uint i;
address _investor;

  function foo() public {
    
for(uint i = 0; i < investors.length; i++){
if (investors[i] == _investor) {
return true;
}

}


  }
}

//#LOOPVARS: i
