






contract C {
  

  

  Synth[] availableSynths;
address synthToRemove;

  function foo() public {
    
for(uint8 i = 0; i < availableSynths.length; i++){
if (availableSynths[i] == synthToRemove) {
delete availableSynths[i];
availableSynths[i] = availableSynths[availableSynths.length - 1];
availableSynths.length--;
break;
}

}


  }

  

}

//#LOOPVARS: i



contract Synth { }
