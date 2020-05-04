






contract C {
  

  

  uint32 key;
uint256 i;
uint256 j;
uint32[] arr;
uint256 n;

  function foo() public {
    
for(i = 1; i < n; i++){
key = arr[i];
for (j = i; j > 0 && arr[j - 1] > key; j--) {
arr[j] = arr[j - 1];
}

arr[j] = key;
}


  }

  

}

//#LOOPVARS: i


