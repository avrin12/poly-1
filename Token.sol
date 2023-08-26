// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract myNFT is ERC721Enumerable, Ownable 
{
    struct NFTMetadata 
    {
        string name;
        string image;
    }

    NFTMetadata[] public nfts;
    uint256 public maxQuantity = 5;
    uint256 public currentTokenId = 0;

    constructor() ERC721("NFTs", "Multiple") 
    {
        nfts.push(NFTMetadata('0', 'QmNvATPSG6TRFRVVUAPpVr9H5HygBeq7JNdUMBMm5u4j6e'));
        nfts.push(NFTMetadata('1', 'QmPkfDTkEruprfnPhfVoEqn8Tc7TFrccUGkwDjo62C4ALG'));
        nfts.push(NFTMetadata('2', 'QmZjqazWmamxi6zEWktLP4FQiUrDjnoiUCNkapBFnZVxjH'));
        nfts.push(NFTMetadata('3', 'QmcmivSkCwispibJHdy5keYCgmPVty4PMFtSoFGZMNVwue'));
        nfts.push(NFTMetadata('4', 'QmafmBoFnvonrArLj1Eh4X6RKUi3rrXQxs4AFi51LWVw2R'));
    }

    function _baseURI() internal pure override returns (string memory) 
    {
        return "https://gateway.ipfs.io/ipfs/";
    }

    function mintNFT(uint256 quantity) external  
    {
        require(currentTokenId + quantity <= maxQuantity, "Exceeds maximum token limit");
        for (uint256 i = 0; i < quantity; i++) {
            _mint(msg.sender, currentTokenId);
            currentTokenId++;
        }
    }

}

contract FxPortalBridge 
{
    event Deposit(address indexed from, address indexed to, uint256 tokenId, string data);

    function deposit(string calldata data, address to, uint256 tokenId) external 
    {
        emit Deposit(msg.sender, to, tokenId, data);
    }
}
