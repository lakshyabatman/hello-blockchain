pragma solidity 0.6.6;


contract MyContract {
    mapping(address => uint64) public balanceRecieved;
    
    function recieveBalance() public payable {
        assert(balanceRecieved[msg.sender]+uint64(msg.value)>=balanceRecieved[msg.sender]);
        balanceRecieved[msg.sender]+=uint64(msg.value);
        
    }
    
    function withdrawBalance(address payable _to , uint64 _amt) public {
        
        require(_amt<=balanceRecieved[_to],"Not enough funds");
        assert(balanceRecieved[_to]-_amt<=balanceRecieved[_to]);
        balanceRecieved[_to]-=uint64(_amt);
        _to.transfer(_amt);
    }
}