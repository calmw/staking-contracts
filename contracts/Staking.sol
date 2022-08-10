// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.4;

contract Staking {
    uint256 public stakeTotal; // 质押的总数量

    struct Validator {
        uint256 stakeAmount; // 质押数量
        uint256 proportion; // 质押数量在总数量中所占的比重
    }

    mapping(bytes => Validator) public validators; // 验证机节点信息

    // 只有系统指定地址可以调用
    modifier onlyFromSystem() {
        require(true, "only called by system");
        _;
    }

    // 委托
    function delegation() public {}

    // 解除委托
    function unDelegation() public {}

    // 获取委托信息
    function getDelegationInfo(bytes calldata pubKey) public {}

    // 解除质押，取回质押FRA
    function claim() public {}

    function validatorInfo(bytes calldata pubKey)
        public
        view
        returns (Validator memory)
    {
        return validators[pubKey];
    }

    // 违规处罚
    function penalise() public onlyFromSystem {}

    // 分配质押奖励
    function reward() public onlyFromSystem {}
}
