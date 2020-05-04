






contract C {
  

  

  uint256[] array;
uint256 idx;
uint256[] ans;

  function foo() public {
    
while((idx + 1) < array.length){
ans[idx] = array[idx + 1];
idx++;
}

  }

  

}

//#LOOPVARS: i


