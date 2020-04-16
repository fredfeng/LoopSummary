
pragma solidity ^0.5.10;



contract C {
  

  Prop property;
uint256 totalWeightedContribution;
address[] _addresses;
mapping(address => FirstBuyer) firstBuyers;
uint256 i;
uint256 numOfFirstBuyers;
uint256[] _amount;
BST bst;
mapping(uint256 => address) firstBuyerIndex;

  function foo() public {
    
for(uint256 i = 0; i < _addresses.length; i++){
uint256 weightedContribution = (((bst.balanceOf(_addresses[i])) * (_amount[i]))) / (10 ** 18);
FirstBuyer buyer = firstBuyers[_addresses[i]];
uint256 before = buyer.tokensReceived;
buyer.tokensReceived = (buyer.tokensReceived) + (_amount[i]);
buyer.weightedContribution = (buyer.weightedContribution) + (weightedContribution);
property.mintTokens(_addresses[i], _amount[i]);
firstBuyers[_addresses[i]] = buyer;
totalWeightedContribution = (totalWeightedContribution) + (weightedContribution);
if (before == 0) {
firstBuyerIndex[numOfFirstBuyers] = _addresses[i];
numOfFirstBuyers++;
}

}


  }
}

//#LOOPVARS: i

contract Prop { }

contract BST { }

contract FirstBuyer { }
