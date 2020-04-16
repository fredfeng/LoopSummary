
pragma solidity ^0.5.10;



contract C {
  

  uint256 high;
uint256 low;
uint32 _odd;
uint32[] _odds;

  function foo() public {
    
while(low < high){
uint256 mid = ((low) + (high)) / 2;
if (_odd >= _odds[mid]) {
low = (mid) + (1);
} else {
high = mid;
}

}

  }
}

//#LOOPVARS: 
