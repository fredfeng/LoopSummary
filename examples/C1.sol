pragma solidity 0.4.24;

contract C1 {

    mapping (address => uint256[]) private lockTime;
    mapping (address => uint256) private lockNum;
    uint later = 1;
    uint earlier = 2;

    function foo(address _address) public {

        uint256[] memory tempLockTime = new uint256[](lockNum[_address]);
	for (uint i = 0; i < lockNum[_address]; ++i) {
	      tempLockTime[i] = lockTime[_address][i]+later-earlier;
	}

    }
}
