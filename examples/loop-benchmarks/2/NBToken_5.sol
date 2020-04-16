
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => ReleaseRecord) releasedRecords;
uint releasedRecordsCount;
bool exist;
uint index;
uint256 timestamp;

  function foo() public {
    
for(uint index = 0; index < releasedRecordsCount; index++){
if ((releasedRecords[index].releasedTime.parseTimestamp().year == timestamp.parseTimestamp().year) && (releasedRecords[index].releasedTime.parseTimestamp().month == timestamp.parseTimestamp().month) && (releasedRecords[index].releasedTime.parseTimestamp().day == timestamp.parseTimestamp().day)) {
exist = true;
}

}


  }
}

//#LOOPVARS: index

contract ReleaseRecord { }
