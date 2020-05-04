






contract C {
  

  

  address[] match_betters;
bool ext;

  function foo() public {
    
for(uint i = 0; i < match_betters.length; i++){
if (match_betters[i] == msg.sender) {
ext = true;
break;
}

}


  }

  

}

//#LOOPVARS: i


