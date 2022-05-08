// arrays in solidity are of a single type, and can have a compile time fixed size or dynamic size. 
// there are afew different ways to init an array

//declaring but not initing with any values:
    uint[] public arr;

// initing with some values:
    uint[] public arr2 = [1, 2, 3];

// arr or fixed size, init with 0s:
    uint[10] public myFixedSizeArr;


// arr getter:
function get(uint i) public view returns (uint) {
        return arr[i];
}


//arr appender:
function push(uint i) public {
        arr.push(i);
}

//arr popper:
function pop() public {
        arr.pop();
}

//arr remover:
function remove(uint index) public {
        delete arr[index];
}

//arr get length:
function getLength() public view returns (uint) {
        return arr.length;
}

//get whole arr
function getArr() public view returns (uint[] memory) {
        return arr;
}


// deletions create gaps in the array, this function moves the last element into its place to delete.
function removeCompact(uint index) public {
        // Move the last element into the place to delete
        arr[index] = arr[arr.length - 1];
        // Remove the last element
        arr.pop();
}

