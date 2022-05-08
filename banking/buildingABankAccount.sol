//classes (contracts) accept and store money nativly, removing the need to integrate with payment gateways.
//eveery user on etherium has an account which are referenced via addressed. 
// applications created on soliditiy have accounts as well
//programs in soliditiy can do whatever they like the the funds allocated to it's account
// the logic written dictates how the program will use the money


pragma solidity >=0.7.0 <0.9.0;

contract SmartBankAccount {

    uint totalContractBalance = 0;

    function getContractBalance() public view returns(uint){
        return totalContractBalance;
    }
    
    mapping(address => uint) balances;
    //timestampts are funky in solidity becuase the current timestamp isnt a thing, this is becuase function calls arnt executed immediatly, theyre grouped into block
    //of afew thousand and excuted all in one go. These blocks are the blocks that make up the block chain. The timestamp will therefore be the time of when that batch    was executed.
    mapping(address => uint) depositTimestamps;

   //the key of the mapping is the user address that is depositing, the value is the amount
   function addBalance() public payable {
        balances[msg.sender] = msg.value;
        totalContractBalance = totalContractBalance + msg.value;
        depositTimestamps[msg.sender] = block.timestamp;
    }
    
    function getBalance(address userAddress) public view returns(uint) {
        uint principal = balances[userAddress];
        uint timeElapsed = block.timestamp - depositTimestamps[userAddress]; //seconds
        return principal + uint((principal * 7 * timeElapsed) / (100 * 365 * 24 * 60 * 60)) + 1; //simple interest of 0.07%  per year
    }
    
    function withdraw() public payable {
        address payable withdrawTo = payable(msg.sender);
        uint amountToTransfer = getBalance(msg.sender);
        withdrawTo.transfer(amountToTransfer);
        totalContractBalance = totalContractBalance - amountToTransfer;
        balances[msg.sender] = 0;
    }
    
    function addMoneyToContract() public payable {
        totalContractBalance += msg.value;
    }
}
