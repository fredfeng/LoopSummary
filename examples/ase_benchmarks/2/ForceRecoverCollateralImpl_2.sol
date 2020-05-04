






contract C {
  

  

  Fraction.Fraction128 Xtemp;
uint256 precision;
Fraction.Fraction128 Xcopy;
Fraction.Fraction128 result;

  function foo() public {
    
for(uint256 i = 1; i <= precision; i++){
Xtemp = ((Xtemp) * (((Xcopy) / (uint128(i)))));
result = ((result) + (Xtemp));
}


  }

  

}

//#LOOPVARS: i



contract Fraction.Fraction128 { }
