pragma solidity ^0.5.10;

contract C {
    
    mapping (address => uint256[]) private lockTime;
    mapping (address => uint256[]) private tempLockTime;
    mapping (address => uint256) private lockNum;
uint256 i;
    address _address;

    function foo() public {

	for (uint i = 0; i < lockNum[_address]; ++i) {
	      tempLockTime[_address][i] = lockTime[_address][i];
	}

    }
}
