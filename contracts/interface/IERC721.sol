// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.4;

interface IERC721 {
    function balanceOf(address owner) external returns (uint256);

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;
}

interface IERC721Mintable {
    function mint(address to) external;
}

interface ERC721Burnable {
    function burn(uint256 tokenId) external;
}

interface IERC721Metadata {
    function tokenURI(uint256 tokenId) external returns (string memory);
}
