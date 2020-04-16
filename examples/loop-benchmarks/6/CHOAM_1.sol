
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint256[] infos;
bytes32[] datas;
Node[] nodes;
address[] addresses;
uint256 id;
uint256[] fees;
uint256 koef;

  function foo() public {
    
for(i = 0; i < 12; i++){
if (i < nodes.length) {
fees[i] = (nodes[id].planet.fee) / (koef);
datas[i] = nodes[id].planet.data;
addresses[i] = nodes[id].planet.owner;
infos[i] = id;
id = nodes[id].next;
}

}


  }
}

//#LOOPVARS: i

contract Node { }
