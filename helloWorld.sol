 pragma solidity ^0.6.2;
 
 contract MyContract {
     string public myString = "Hello";
     uint256 public myVariable = 0;
     
     function setMyVal(uint256 x) public {
         myVariable = x;
     }
     
     uint256 public y;
     function decrease() public {
         y--;
     }
     
     function inrease() public {
         y++;
     }
 }