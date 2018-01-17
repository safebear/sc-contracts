pragma solidity ^0.4.19;

contract BaseToken {
// This is the token for bases and lairs
// Probably the most important token!
// We need to identify if it's a base or a lair (from now on just called bases)
// We need to be able to create base
// We need to be able to trade base
// We need to be able to assign a base to a user
// We need to be able to query if a base is assigned to a user

event NewBase(uint baseId, string name, uint dna, string typeOf, int[2] location);
uint dnaDigits = 16;
uint dnaModulus = 10 ** dnaDigits;

struct Base {   
    // type of base or lair
    string typeOf;
    string name;
    uint dna;
    // location - assuming this is latitude and longitude
    // Solidity doesn't support decimals
    // Needs to be converted to an integer before passing through
    int[2] location;
}

Base[] public bases;

// marking as private as only used in contract. Note the underscore before the function name.

function _createBase(string _typeOf, string _name, uint _dna, int[2] _location) private {
    uint id = bases.push(Base(_typeOf,_name,_dna,_location)) - 1;
    NewBase(id,_name,_dna, _typeOf, _location);
}

// the 'view' keyword means that we view contract variables with this function, but don't update it.
// the 'pure' keyword means that we only use local variables within the function

function _generateRandomDna(int[2] _location) private view returns (uint) {
    uint rand = uint(keccak256(_location[0]+_location[1]));
    return rand % dnaModulus;

}

function createRandomBase(string _name, string _typeOf, int[2] _location) public {
    uint randDna =_generateRandomDna (_location);
    _createBase(_typeOf, _name, randDna, _location);
}


}
