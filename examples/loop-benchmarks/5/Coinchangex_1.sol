
pragma solidity ^0.5.10;



contract C {
  

  bool applied;
SpecialTokenBalanceFeeTake[] specialFees;
uint amount;
mapping(address => mapping(address => uint)) tokens;
uint length;
uint MAX_SPECIALS;
uint256 feeTakeXfer;
uint i;

  function foo() public {
    
for(uint i = 0; length > 0 && i < length; i++){
SpecialTokenBalanceFeeTake special = specialFees[i];
if (special.exist && special.balance <= tokens[special.token][msg.sender]) {
applied = true;
feeTakeXfer = ((amount) * (special.feeTake)) / (1 ether);
break;
}

if (i >= MAX_SPECIALS) break;

}


  }
}

//#LOOPVARS: i

contract SpecialTokenBalanceFeeTake { }

contract address => mappingaddress { }
