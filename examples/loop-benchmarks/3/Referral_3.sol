
pragma solidity ^0.5.10;



contract C {
  

  uint8 _status;
address _node;
Data data;
uint refDep;
uint[] thresholds;
mapping(uint => uint8) statusThreshold;
uint i;

  function foo() public {
    
for(uint i = thresholds.length - 1; i > _status; i--){
uint threshold = thresholds[i] * 100;
if (refDep >= threshold) {
data.setStatus(_node, statusThreshold[threshold]);
break;
}

}


  }
}

//#LOOPVARS: i

contract Data { }
