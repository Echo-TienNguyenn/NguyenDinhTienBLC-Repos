// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleMintContract is ERC721, Ownable {
    uint256 public mintPrice = 0.05 ether;
    uint256 public totalSupply;
    uint256 public maxSupply;
    bool public isMintedEnable;
    mapping (address => uint256) public mintedWallets;

    constructor() payable ERC721('Simple Mint', 'SIMPLEMINT') {
        maxSupply = 2;
    }

    function toggleIsMintedEnabled() external onlyOwner {
        isMintedEnable = !isMintedEnable;
    }

    function setMaxSupply (uint256 maxSupply_) external onlyOwner {
        maxSupply = maxSupply_;
    }

    function mint() external payable {
        require(isMintedEnable, 'minting not enable');
        require(mintedWallets[msg.sender] < 1, 'exceed max per wallet');
        require(msg.value == mintPrice, 'wrong value');
        require(maxSupply >totalSupply, 'sold out');

        mintedWallets[msg.sender]++;
        totalSupply++;
        uint256 tokenId = totalSupply;
        _safeMint(msg.sender, tokenId);   
    }
}