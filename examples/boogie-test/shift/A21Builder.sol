pragma solidity ^ 0.5.1; 

/***
 *       ___     ___      _    
 *      /   \   |_  )    / |   
 *      | - |    / /     | |   
 *      |_|_|   /___|   _|_|_  
 *    _|"""""|_|"""""|_|"""""| 
 *    "`-0-0-'"`-0-0-'"`-0-0-' 
 * 
 * https://a21.app
 */
 
contract A21Builder{

    function removeIndex(uint[] storage values, uint i) internal {      
    if(i<values.length){ 
        while (i<values.length-1) {
            values[i] = values[i+1];
            i++;
        }
        values.length--;
    }
  }


}
