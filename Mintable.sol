// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.8.22;

import "./TokenP.sol";

contract MintableToken is Token {
    uint256 public totalMinted;
    uint256 public totalMintable;

    constructor(uint256 totalMintable_) {
        totalMintable = totalMintable_;
    }

    function mint(uint256 value) public onlyOwner {
        require(value + totalMinted < totalMintable);
        totalMinted += value;

        balances[msg.sender] += value;
    }
}
contract TestToken is MintableToken {
    address echidna = msg.sender;

    constructor() MintableToken(10_000) {
        owner = echidna;
    }

    function echidna_test_balance() public view returns (bool) {
        return balances[msg.sender] <= 10_000;
    }
}
