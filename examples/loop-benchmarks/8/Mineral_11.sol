
pragma solidity ^0.5.10;



contract C {
  

  uint a;
uint total;
uint32[] area;
uint32 current;
address _user;
uint len;
bool finish;
mapping(address => uint[][]) deployRange;
uint i;

  function foo() public {
    
for(uint i = 0; i < len; i += 1){
uint s = uint128(deployRange[msg.sender][area[a]][i]);
uint e = uint128(deployRange[msg.sender][area[a]][i] >> 128);
if (current < e && current >= s) {
total += _collect(_user, uint32(s), current, area[a]);
deployRange[msg.sender][area[a]][i] = current | (e << 128);
finish = false;
} else if (current >= e) {
total += _collect(_user, uint32(s), uint32(e), area[a]);
}


}


  }
}

//#LOOPVARS: i
