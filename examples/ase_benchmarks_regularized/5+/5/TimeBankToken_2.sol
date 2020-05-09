






contract C {
  

  

  address[] managerList;
uint j;
mapping(address => bool) managers;
mapping(address => bool) checked;
address[] res;

  function foo() public {
    
for(uint i = 0; i < managerList.length; i++){
address manager = managerList[i];
if (managers[manager] && checked[manager] == false) {
res[j] = manager;
checked[manager] = true;
j++;
}

}


  }

  

}

//#LOOPVARS: i


