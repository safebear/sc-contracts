pragma solidity ^0.4.19;

import "./ownable.sol";

contract GTokenFactory is Ownable {
// This is the token for bases and lairs
// Probably the most important token!
// We need to identify if it's a base or a lair (from now on just called bases)
// We need to be able to create base
// We need to be able to trade base
// We need to be able to assign a base to a user
// We need to be able to query if a base is assigned to a user

event NewToken(uint tokenId, string name, uint dna, string typeOf, int[2] location);

uint dnaDigits = 16;
uint dnaModulus = 10 ** dnaDigits; 

struct Token {   
    // type of base or lair / good or evil
    string typeOf;
    string name;
    uint dna;
    // location - assuming this is latitude and longitude
    // Solidity doesn't support decimals
    // Needs to be converted to an integer before passing through
    int[2] location;
}

Token[] public tokens;
uint[] serverId;

mapping (uint => address) public tokenToOwner;
mapping (address => uint) ownerTokenCount;

// marking as internal as only used in contract or by contracts that inherit it. Note the underscore before the function name.

// We need another function here with the onlyOwner modifier that passes throught a unique Id
// given to the user when they're in range of the base.
// This is then compared to the id the user passes through when calling the create function
// We also need to ensure that the base isn't already taken - check the location parameter

function _createToken(string _typeOf, string _name, uint _dna, int[2] _location) internal {
    // need a way to ensure that they are authorised to request this - how?
    // need a require(a == b) statement, some approval from the app server somehow.
    // when using require with msg.sender this variable must come first
    uint id = tokens.push(Token(_typeOf,_name,_dna,_location)) - 1;
    NewToken(id,_name,_dna, _typeOf, _location);
    // need to ensure that we invoke this method with the user's ethereum address
    // the user will need money to pay for this
    tokenToOwner[id] = msg.sender;
    ownerTokenCount[msg.sender]++;
}

// the 'view' keyword means that we view contract variables with this function, but don't update it.
// the 'pure' keyword means that we only use local variables within the function

function _generateRandomDna(int[2] _location) private view returns (uint) {
    uint rand = uint(keccak256(_location[0]+_location[1]));
    return rand % dnaModulus;

}

function createRandomBase(string _name, string _typeOf, int[2] _location) public {
    uint randDna =_generateRandomDna (_location);
    _createToken(_typeOf, _name, randDna, _location);
}
}