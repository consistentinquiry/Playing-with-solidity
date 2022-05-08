//there are afew ways to return outputs from a function
// public functions cannot accept certain data types as inputs or outputs

//solidity supports returning more than one return value from a functions (wtf mind === blown)
function returnMany()
        public
        pure
        returns (
            uint,
            bool,
            uint
        )
    {
        return (1, true, 2);
}


//return values can be named:
function named()
        public
        pure
        returns (
            uint x,
            bool b,
            uint y
        )
    {
        return (1, true, 2);
}


//return values can be assigned to their name.
//in this case the return statement can be omitted.
    function assigned()
        public
        pure
        returns (
            uint x,
            bool b,
            uint y
        )
    {
        x = 1;
        b = true;
        y = 2;
    }

//destructing assignments are used when calling another function that returns multiple values
function destructingAssigments()
        public
        pure
        returns (
            uint,
            bool,
            uint,
            uint,
            uint
        )
    {
        (uint i, bool b, uint j) = returnMany();

        // Values can be left out.
        (uint x, , uint y) = (4, 5, 6);

        return (i, b, j, x, y);
 }






