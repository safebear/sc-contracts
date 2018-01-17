pragma solidity ^0.4.19;

import "./gTokenFactory.sol";
contract BaseToken is GTokenFactory {

// remember to use storage for blockchain records or memory for temporary storage.
// e.g. Token storage myToken = token[tokenId]; 

// note that you can only access public functions from a child contract
// private functions in gTokenFactory can't be accessed
// instead you need internal and external.
// internal is the same as private, except it's also accessable to child contracts
// external functions can ONLY be called outside the contract and are good for setting contract ddresses
// or any values that should be hardcoded by might need to be changed if something goes wrong
// they can't be called from any other functions inside the contract

// To call functions on contracts we don't own, we need to create an interface
// See Chapter 10 lesson 2 in CryptoZombies

// Worth looking at the Kitty code to see how complex the Kitty struct is

// functions can return multiple values

// how to hardcode an address:
// address serverAddress = 0x790732789789689656348965;

// Try never to hardcode any values - especially addresses - as they may need to change
// Better to use a function to se an address

// Making contracts ownable gives the owner special privilages

// OpenZeppelin is a library of secure and community vetted smart contracts to use
// There's also good examples of how comments should work

// Copy and paste the ownable.sol contract and then make sure all other contracts
// inherit from it. Then we can limit functions to 'only owner'.
// these should really only be maintenance functions I guess.


}

