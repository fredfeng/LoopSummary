






contract C {
  

  

  mapping(uint => uint) totalLevelDivs;
mapping(uint => address) levelOwner;
uint _distDividends;
uint _distFactor;
mapping(address => uint) ownerAccounts;
uint counter;
address dev;
uint nextAvailableLevel;

  function foo() public {
    
while(counter < nextAvailableLevel){
uint _distAmountLocal = ((_distDividends) / (_distFactor));
ownerAccounts[levelOwner[counter]] = ((ownerAccounts[levelOwner[counter]]) + (_distAmountLocal));
totalLevelDivs[counter] = ((totalLevelDivs[counter]) + (_distAmountLocal));
counter = counter + 1;
ownerAccounts[dev] = ((ownerAccounts[dev]) - (_distAmountLocal));
_distFactor = ((((_distFactor) * (112))) / (100));
}

  }

  

}

//#LOOPVARS: i


