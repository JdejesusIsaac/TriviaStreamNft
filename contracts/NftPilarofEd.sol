// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "base64-sol/base64.sol";

contract NftPilarofEducation is ERC721 {
    string public constant TOKEN_IMAGE_URI =
        "https://ipfs.io/ipfs/QmUeXV63VvrYXwD65gtEz6WFCJxo62PHJ5pCuifC6qm6uU";
    uint256 internal s_tokenCounter;
    mapping(address => bool) public s_hasNft;

    constructor()
        ERC721("StreamTrivia","level 1")
            
        
        
    {
        s_tokenCounter = 0;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function _mintByAddress(address addr) internal {
        _safeMint(addr, s_tokenCounter);
        s_tokenCounter = s_tokenCounter + 1;
        s_hasNft[addr] = true;
    }

    function _mintNft() internal {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter = s_tokenCounter + 1;
        s_hasNft[msg.sender] = true;
    }

    function tokenURI(
        uint256 /* tokenId */
    ) public view override returns (string memory) {
        return
            string(
                abi.encodePacked(
                    _baseURI(),
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name":"',
                                name(),
                                '", "description":"You captured this NFT as part of the educational Stream!", ',
                                '"attributes": [{"trait_type": "skills", "value": 100}], "image":"',
                                TOKEN_IMAGE_URI,
                                '"}'
                            )
                        )
                    )
                )
            );
    }

    function hasNft(address addr) public view returns (bool) {
        return s_hasNft[addr];
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}