
pragma solidity ^0.5.10;



contract C {
  

  uint _pollID;
uint nodeID;
uint _numTokens;
mapping(address => DLL.Data) dllMap;
uint tokensInNode;
address _voter;

  function foo() public {
    
while(nodeID != 0){
tokensInNode = getNumTokens(_voter, nodeID);
if (tokensInNode <= _numTokens) {
if (nodeID == _pollID) {
nodeID = dllMap[_voter].getPrev(nodeID);
}

return nodeID;
}

nodeID = dllMap[_voter].getPrev(nodeID);
}

  }
}

//#LOOPVARS: 

contract DLL.Data { }
