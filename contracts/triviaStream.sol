// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./NftPilarofEd.sol";

contract StreamNft is NftPilarofEducation {
    constructor() NftPilarofEducation() {}

    function mintNft(uint256 value) public {
        require(2 + value == 4, "Wrong value!");
        _mintNft();
    }
}