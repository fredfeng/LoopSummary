






contract C {
  

  

  address[] stakeHolders;
mapping(address => uint256) stakeHoldersWeight;
uint256 _total;

  function foo() public {
    
for(uint256 count = 0; count < stakeHolders.length; count++){
_total = ((_total) + (stakeHoldersWeight[stakeHolders[count]]));
}


  }

  

}

//#LOOPVARS: count


