






contract C {
  

  

  uint256 first;
uint256 last;
uint256 n;

  function foo() public {
    
while(first < last){
uint256 check = (first + last) / 2;
if ((n >> check) == 0) {
last = check;
} else {
first = check + 1;
}

}

  }

  

}

//#LOOPVARS: i


