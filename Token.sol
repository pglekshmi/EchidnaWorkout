//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;
contract Token {
    mapping(address => uint256) public balances;

    function airdrop() public {
        balances[msg.sender] = 1000;
    }

    function consume() public {
        require(balances[msg.sender] > 0);
        balances[msg.sender] -= 1;
    }

    function backdoor() public {
        balances[msg.sender] += 1;
    }
}
contract TestToken is Token{
    constructor(){}
    function echidna_Test_balance()public view returns(bool){
        return balances[msg.sender] <= 1000;
    }
}
