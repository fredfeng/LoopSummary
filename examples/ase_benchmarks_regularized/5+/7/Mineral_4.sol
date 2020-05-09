






contract C {
  

  

  uint[] distinctArea;
uint j;
uint distinctAreaLength;
uint32[] area;

  function foo() public {
    
for(uint i = 0; i < area.length; i++){
bool find = false;
for (uint j = 0; j < distinctAreaLength; j++) {
if (distinctArea[j] == area[i]) {
find = true;
break;
}

}

if (!find) {
distinctArea[distinctAreaLength] = area[i];
distinctAreaLength += 1;
}

}


  }

  

}

//#LOOPVARS: i


