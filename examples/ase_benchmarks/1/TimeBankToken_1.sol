






contract C {
  

  

  address[] managerList;
mapping(address => bool) checked;

  function foo() public {
    
for(uint k = 0; k < managerList.length; k++){
checked[managerList[k]] = false;
}


  }

  

}

//#LOOPVARS: k


