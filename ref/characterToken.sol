pragma solidity ^0.4.19;

import "./gTokenFactory.sol";
contract CharacterToken is GTokenFactory {

/**
character tokens will probably need to have life points (maybe this is the currency?)
associated with them. So that when they're attacked they lose something
and when they save someone or attack someone, they gain something.

do we need a cooldown period for attacking other characters or saving them? Like in Zombies?
*/

/**
Should we have levels for characters also? And use the modifier function 
like in the zombies game?

modifier aboveLevel(uint _level, uint _zombieId) {
    require(zombies[_zombieId].level >= _level);
    _;
}

*/



}