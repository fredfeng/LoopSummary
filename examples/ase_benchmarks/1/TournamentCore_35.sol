






contract C {
  

  

  uint32 key;
uint256 i;
uint256 j;
uint32[] arr;

  function foo() public {
    
for(j = i; j > 0 && arr[j - 1] > key; j--){
arr[j] = arr[j - 1];
}


  }

  

}

//#LOOPVARS: j


