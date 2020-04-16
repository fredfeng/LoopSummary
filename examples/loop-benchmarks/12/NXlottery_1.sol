
pragma solidity ^0.5.10;



contract C {
  

  address[] allAddress;
uint8 whichTeamWin;
uint256 currentIn;
uint256 pot;
mapping(address => Datasets.Player) allPlayer;
uint i;

  function foo() public {
    
for(uint i = 0; i < allAddress.length; i++){
address curr = allAddress[i];
uint256 temp;
if (whichTeamWin == 0) {
temp = allPlayer[curr].currentroundIn0;
} else {
temp = allPlayer[curr].currentroundIn1;
}

uint256 amount = 0;
if (temp > 0) {
amount = ((pot) * (temp)) / (currentIn);
allPlayer[curr].win = (allPlayer[curr].win) + (amount);
}

allPlayer[curr].lastwin = amount;
allPlayer[curr].currentroundIn0 = 0;
allPlayer[curr].currentroundIn1 = 0;
}


  }
}

//#LOOPVARS: i

contract Datasets.Player { }
