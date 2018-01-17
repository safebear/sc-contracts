pragma solidity ^0.4.19;

import "./gTokenFactory.sol";
contract BaseToken is GTokenFactory {

// remember to use storage for blockchain records or memory for temporary storage.
// e.g. Token storage myToken = token[tokenId]; 

// note that you can only access public functions from a child contract
// private functions in gTokenFactory can't be accessed
// instead you need internal and external.
// internal is the same as private, except it's also accessable to child contracts
// external functions can ONLY be called outside the contract 
// they can't be called from any other functions inside the contract

}

