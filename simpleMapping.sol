pragma solidity ^0.6.0;

contract MySimpleMapping {
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public users;
    
    function setMyMappingValue (uint _index)  public {
        myMapping[_index] = true;
    }
    
    function setUsersMapping(address _user) public {
        users[_user] = true;
    }
}
