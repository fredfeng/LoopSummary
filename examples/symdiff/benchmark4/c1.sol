pragma solidity ^0.5.10;

contract C1 {
    
    struct Pepe {
        address owner;
        uint256 price;
    }

    Pepe[16] data;

    address[]  owners = new address[](16);
    uint256[]  prices =  new uint256[](16);

    function foo() public {

       // address[] memory owners = new address[](16);
       // uint256[] memory prices =  new uint256[](16);

        for (uint i2=0; i2<16; i2++) {
            owners[i2] = (data[i2].owner);
            prices[i2] = (data[i2].price);
        }

    }
}
