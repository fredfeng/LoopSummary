/* pragma solidity ^0.4.18; */
pragma solidity ^0.5.10;

contract C {
  
  mapping (address => bool) public frozenAccount;
  mapping (address => uint256) public unlockUnixTime;
  uint256 public now;
  
  function foo(address[] memory addresses, uint[] memory amounts) public returns (uint256) {
    uint256 totalAmount = 0;
    for(uint j = 0; j < addresses.length; j++){
            require(amounts[j] > 0
                    /* && addresses[j] != 0x0 */
                    && addresses[j] != address(0x0)
                    && frozenAccount[addresses[j]] == false
                    && now > unlockUnixTime[addresses[j]]);
                    
            /* amounts[j] = amounts[j].mul(1e8); */
            amounts[j] = amounts[j] * 100000000;
            /* totalAmount = totalAmount.add(amounts[j]); */
            totalAmount = totalAmount + amounts[j];
    }

    return totalAmount;
  }
    
}

