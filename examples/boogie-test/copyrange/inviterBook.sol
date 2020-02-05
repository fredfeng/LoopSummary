/**+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                            abcLotto: a Block Chain Lottery

                            Don't trust anyone but the CODE!
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
 /*
 * This product is protected under license.  Any unauthorized copy, modification, or use without 
 * express written consent from the creators is prohibited.
 */
 
/**+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                           this inviter book can be used by your applications too.
                           
                           have you heard about The 2009 DARPA Network Challenge?
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
pragma solidity ^0.5.1;

contract foo {
   /*
    * @dev transfer bytes32 to string
    */    
     function bytes32ToString(bytes32 x) 
        internal pure 
        returns (string memory)
    {
         bytes memory bytesString = new bytes(32);
         uint charCount = 0;
         bytes memory bytesStringTrimmed = new bytes(charCount);
         for (uint j = 0; j < charCount; j++) {
             bytesStringTrimmed[j] = bytesString[j];
         }
 	 return string(bytesStringTrimmed);
     }
     
  }
