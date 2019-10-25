pragma solidity ^0.5.10;

contract C2 {
    
    mapping (address => uint256) private lockNum;
    mapping (address => uint256[]) private lockValue;
    uint _balance;

    function foo(address _address) public {

        for(uint i=0; i < lockNum[_address];i++){
            _balance = _balance + (lockValue[_address][i]);
        }

    }
}
