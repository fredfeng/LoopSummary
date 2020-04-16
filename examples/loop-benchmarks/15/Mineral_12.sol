
pragma solidity ^0.5.10;



contract C {
  

  uint a;
mapping(address => uint[][]) deployRange;
uint32[] area;

  function foo() public {
    
for(uint a = 0; a < area.length; ++a){
uint len = deployRange[msg.sender][area[a]].length;
bool finish = true;
for (uint i = 0; i < len; i += 1) {
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

if (finish) {
deployRange[msg.sender][area[a]].length = 0;
} else {
deployRange[msg.sender][area[a]][0] = deployRange[msg.sender][area[a]][len - 1];
deployRange[msg.sender][area[a]].length = 1;
}

}


  }
}

//#LOOPVARS: a
