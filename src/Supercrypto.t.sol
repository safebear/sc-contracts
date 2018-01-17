pragma solidity ^0.4.19;

import "ds-test/test.sol";

import "./Supercrypto.sol";

contract SupercryptoTest is DSTest {
    Supercrypto supercrypto;

    function setUp() public {
        supercrypto = new Supercrypto();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
