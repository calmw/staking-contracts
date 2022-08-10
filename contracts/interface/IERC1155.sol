// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.4;

interface IERC1155 {
    function uri(uint256) external returns (string memory);

    function balanceOf(address account, uint256 id) external returns (uint256);

    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) external;
}

interface IERC1155Mintable {
    function mintBatch(
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) external;
}

interface IERC1155Burnable {
    function burnBatch(
        address account,
        uint256[] memory ids,
        uint256[] memory values
    ) external;
}

interface IERC1155Metadata {
    function tokenURI(uint256 tokenId) external returns (string memory);
}
