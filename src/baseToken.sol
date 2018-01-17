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

// Inside structs, you should use the smallest uint size possible to save space
// for small integers (e.g. timestamp), use uint32 rather than uint (which is uint256)
// and also cluster identical data types together to save space

/**
solidity native time units:

'now' will return the current unix timestamp
the number of seconds since Jan 1st 1979 - 748397582375 (a 32 bit number)
now returns a uint256, so you need to convert it to a uint32 using uint32()

Unix time is traditionally stored in a 32-bit number, 
which will lead to the year 2038 problem.
But if we store it as a 64 bit number it was cost our users more to run the contract

time units seconds, minutes, hours, days, weeks, and years convert to a uint of the number 
of seconds in that time.

1 minute is 60, 1 hour 3600 etc.

uint lastUpdated;

// set 'lastUpdated' to 'now'
function updateTimestamp() public {
    lastUpdated = now;
}

// Will return true if 5 minutes have passed since 'updateTimestamp' was 
// called, 'false' if 5 minutes have not passed
function fiveMinutesHavePassed() public view returns (bool) {
    return (now >= (lastUpdated + 5 minutes));
}

remember to use 'view' functions as these don't cost gas (e.g. 'external view' for
functions where you only need to query the blockchain).

View functions are only free when called externally. If they're called by another
function which is not 'view' they cost money.

Cheaper to use 'memory' to store data rather than 'storage' if you use 'storage'
in a 'external view' function, then that function will cost money!

memory arrays must be created with a length argument. E.g.
uint[] memory values = new uint[](3);
the length is 3.
See in Crypto Zombies level 3 chapter 11 how to set this array length using a count function. 

*/


}

