pragma solidity 0.6.6;

contract BasicContract {
    
    uint public balanceRecieved;
    bool public paused;
    
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function sendMoney() public payable {
        balanceRecieved+=msg.value;
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function togglePaused(bool _paused) public {
        require(msg.sender == owner, "You're not owner");
        paused = _paused;
    }
    
    function withdrawBalance( address payable _to) public {
        balanceRecieved-=this.getBalance();
        _to.transfer(this.getBalance());
    }
    
    
    function withDrawAll(address payable _to) public {
        require(msg.sender == owner, "You're not owner");
        require(!paused,"The contract is paused");
        balanceRecieved-=this.getBalance();
        _to.transfer(address(this).balance);
    }
    
    function destructContract(address payable _to) public {
        require(msg.sender == owner, "You're not owner");
        selfdestruct(_to);
    }
}