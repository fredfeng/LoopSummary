contract FounderThreader {


  uint public hardCap = 300000000000000000000000000; // 300 000 000 * 1e18
  uint public remain = 300000000000000000000000000; // 300 000 000 * 1e18

  uint public minTx = 100000000000000000000; // 100 * 1e18

  mapping(address => bool) isFounder;

  function isFounderThreader (address[] memory _founders) public {
    for (uint i = 0; i < _founders.length; i++) {
      isFounder[_founders[i]] = true;
    }
  }

}
