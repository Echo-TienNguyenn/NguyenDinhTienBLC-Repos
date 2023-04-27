// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
    
contract PrivateKeyGenerator {
    using SafeMath for uint256;

    //generate Private Key using block.timestamp to get a random value change over time
    function generatePrivateKey() public view returns (bytes32) {
        bytes32 privatekey = keccak256(abi.encodePacked(block.timestamp));
        return privatekey;
    }

    //generate PublicKey from PrivateKey using ecrecover function
    function getPublicKey(uint256 privateKey) public pure returns (bytes32) {
        bytes32 publicKey = keccak256(abi.encodePacked(ecrecover(bytes32(0), uint8(privateKey & 1), bytes32(privateKey), bytes32(0))));
        return publicKey;
    }
    //get the hash from publickey and creat wallet by taking 20 byte out of that hash
    function generateAddress(bytes32 publicKey) public pure returns (address) {
        bytes32 hash = keccak256(abi.encodePacked(publicKey));
        address walletAddress = address(uint160(uint256(hash)));
        return walletAddress;
    }   

}



