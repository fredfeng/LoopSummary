






contract C {
  

  

  uint decimals;
uint tempNewSum;
uint tempInitSum;
uint round;
uint cnt;
uint[] dec;

  function foo() public {
    
while((tempNewSum > 0 || tempInitSum > 0) && cnt <= decimals){
uint lastInitSum = tempInitSum % 10;
tempInitSum = tempInitSum / 10;
uint lastNewSum = tempNewSum % 10;
tempNewSum = tempNewSum / 10;
if (cnt >= round) {
if (lastNewSum >= lastInitSum) {
dec[decimals - cnt] = ((dec[decimals - cnt]) + (lastNewSum - lastInitSum));
} else {
dec[decimals - cnt] = ((dec[decimals - cnt]) - (lastInitSum - lastNewSum));
}

}

cnt = cnt + 1;
}

  }

  

}

//#LOOPVARS: i


