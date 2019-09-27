pragma solidity ^0.5.10;

contract C1 {
    
    struct Pepe {
        address owner;
        uint256 price;
    }

    Pepe[16] data;

    function foo() public {

        address[] memory owners = new address[](16);
        uint256[] memory prices =  new uint256[](16);

        for (uint i=0; i<16; i++) {
            owners[i] = (data[i].owner);
            prices[i] = (data[i].price);
        }

    }
}
