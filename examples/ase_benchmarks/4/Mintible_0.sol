






contract C {
  

  

  uint256 high;
uint32 _odd;
uint32[] _odds;
uint256 low;

  function foo() public {
    
while(low < high){
uint256 mid = (((low) + (high))) / 2;
if (_odd >= _odds[mid]) {
low = ((mid) + (1));
} else {
high = mid;
}

}

  }

  

}

//#LOOPVARS: i


