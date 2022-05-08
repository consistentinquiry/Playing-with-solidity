//ethereum staking is the process of locking up some amount of Ethers for a defined period of time in order to contribute to the security of the blockchain and earn rewards. Proof of stake relies on the concept of thousands of computers saying "I promise im not lying and if i am you can take my money". Money is taken away from those who misbahave but rewards are given to those who tell the truth. The more you stake, the more you earn, assuming you behave.

pragma solidity >=0.7.0; 

contract Storage {
    uint totalContractBalance = 0;
    mapping(address => uint) public balance;

    //solidity only supports integer values and we need to convert ETH to wei so we multiply 10^18
    uint constant public threshold = 0.003 * 10**18;
    uint public deadline = block.timestamp + 1 minutes;
    
    function getContractBalance() public view returns(uint){
        return totalContractBalance;
    }

    function isActive() public view returns(bool){
        return block.timestamp = threshold;
    }

    

    function deposit() public payable {
        balance[msg.sender] += msg.value;
        totalContractBalance += msg.value;
    }

    receive() external payable { deposit(); }

    function withdraw() public {
        require(block.timestamp > deadline, "deadline hasn't passed yet");
        require(!isActive(), "Contract is active");
        require(balance[msg.sender] > 0, "You haven't deposited");
        uint amount = balance[msg.sender];
        balance[msg.sender] = 0;
        totalContractBalance -= amount;
        payable(msg.sender).transfer(amount);
    }   

}
