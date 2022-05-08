//Maps are created with the syntax mapping(keyType => valueType).
//keyType can be value types such as uint, address or bytes.
//valueType can be any type including another mapping or an array.
//Mappings are not iterable.
//Write a mapping to the store address to uint mapping.

mapping(address => uint) public myMap;

//a function that returns the value of a mapping when supplied a key
function get(address _addr) public view returns (uint) {
        return myMap[_addr];
}

//a default value is returned if a value is never set

//a map setter function:
function set(address _addr, uint _i) public {
        myMap[_addr] = _i;
}

//a function to remove a value:

function remove(address _addr) public {
        delete myMap[_addr];
}
