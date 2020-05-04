






contract C {
  

  

  uint8 __right;
uint8 __sindex;
uint8 __tindex;
uint[] __t;
uint[] __s;
uint8 __left;

  function foo() public {
    
for(__tindex = __left; __tindex <= __right; __tindex++){
__s[__sindex] = __t[__tindex];
__sindex++;
}


  }

  

}

//#LOOPVARS: __tindex


