// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WalletContract{
    uint public totalSupply;
    mapping(address=>uint) public balanceOf;

    function mint(address _to, uint _amount) private {
        totalSupply += _amount;
        balanceOf[_to] += _amount;

    }

    function burn(address _from, uint _amount) private {
        totalSupply -= _amount;
        balanceOf[_from] -= _amount;
    }

    function transfer(address _to, uint _amount) public {
        require (balanceOf[msg.sender] >= _amount, "Not Enough Money Brokie");
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
    }
}
    

