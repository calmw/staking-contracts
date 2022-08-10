// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.4;

interface IERC20 {
    function balanceOf(address account) external returns (uint256);

    function transferFrom(
        address from, //msg.sender
        address to, // handler
        uint256 amount
    ) external;

    function transfer(address to, uint256 amount) external;
}

interface IERC20Mintable {
    function mint(address to, uint256 amount) external;
}

interface IERC20Burnable {
    function burnFrom(address account, uint256 amount) external;
}
