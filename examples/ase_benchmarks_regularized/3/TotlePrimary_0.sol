






contract C {
  

  

  address target;
address[] authorities;

  function foo() public {
    
for(uint i = 0; i < authorities.length; i++){
if (authorities[i] == target) {
authorities[i] = authorities[authorities.length - 1];
authorities.length -= 1;
break;
}

}


  }

  

}

//#LOOPVARS: i


