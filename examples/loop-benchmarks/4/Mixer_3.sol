
pragma solidity ^0.5.10;



contract C {
  

  uint256 tag_y;
uint256 csum;
Data self;
uint256 hashout;
uint256 tag_x;
uint256[] ctlist;
uint i;

  function foo() public {
    
for(uint i = 0; i < self.pubkeys.length; i++){
uint256 cj = ctlist[2 * i] % bn256g1.genOrder();
uint256 tj = ctlist[2 * i + 1] % bn256g1.genOrder();
hashout = ringLink(hashout, cj, tj, bn256g1.Point(tag_x, tag_y), self.hash, self.pubkeys[i]);
csum = addmod(csum, cj, bn256g1.genOrder());
}


  }
}

//#LOOPVARS: i

contract Data { }
