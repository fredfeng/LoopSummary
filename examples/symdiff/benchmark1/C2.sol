pragma solidity ^0.5.10;

contract C2 {

    mapping (address => uint256[]) private tempLockTime;
    mapping (address => uint256[]) private lockTime;
    mapping (address => uint256) private lockNum;
    uint later = 1;
    uint earlier = 2;

    function foo(address _address) public {

	uint i = 0;
        // uint256[] memory tempLockTime = new uint256[](lockNum[_address]);

	while (i < lockNum[_address]) {
	   tempLockTime[_address][i] = lockTime[_address][i] + later - earlier;            
	   i++;
	}
    }
}
