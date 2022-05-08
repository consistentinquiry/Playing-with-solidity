
uint public num;

//Each function call is a new transaction , these transactions have fees so in order to mutate state a transaction must be made which requires a fee
//Reading state is free tho, yay


//A function to read the state variable or a getter in other words
function get() public view returns (uint) {
  return num;
}

//the view modifier (keyword) tells the compiler that this fucntion doesnt modify the state variables.

//A function to set the state variable

function set(uint _num) public {
  num = _num;
} 

//When this function is called and passed an unsigned int, the balance of the account post call is slightly less, showing the fee for state change mechanism in action.
// notice the lack of view keyword as it isnt a read only function, state is being mutated.



