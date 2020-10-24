pragma solidity 0.6.6;

contract SendValue {
    
    mapping(address => uint ) public balanceRecieved;
    bool public paused;
    
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function sendMoney() public payable {
        balanceRecieved[msg.sender]+=msg.value;
    }
    
    function getBalance(address _user) public view returns(uint) {
        return balanceRecieved[_user];
    }
    
    function togglePaused(bool _paused) public {
        require(msg.sender == owner, "You're not owner");
        paused = _paused;
    }
    
    
    function withDraw(address payable _to, uint amt) public {
        require(balanceRecieved[msg.sender]<=amt,"Insufficient Funds");
        balanceRecieved[msg.sender]-=amt;
        _to.transfer(amt);
    }
    
    
    function destructContract(address payable _to) public {
        require(msg.sender == owner, "You're not owner");
        selfdestruct(_to);
    }
}