






contract C {
  

  

  Synth[] availableSynths;
bool isSynth;

  function foo() public {
    
for(uint8 i = 0; i < availableSynths.length; i++){
if (availableSynths[i] == msg.sender) {
isSynth = true;
break;
}

}


  }

  

}

//#LOOPVARS: i



contract Synth { }
