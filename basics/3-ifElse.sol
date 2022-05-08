//Solidity supports if, else if, else and ternary operators.

// if else condition to return 0 if the value is less than 10, 1 if greater than 20 or 2 otherwise.
function foo(uint x) public pure returns (uint) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
}


//now the ternary operator, the tastiest of operators
function ternary(uint _x) public pure returns (uint) {
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        // shorthand way to write if / else statement
        return _x < 10 ? 1 : 2;
}
