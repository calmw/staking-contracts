// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.4;

contract Staking {
    // 最少的质押数量为 1 FRA.
    uint256 public stakingMin = 10**18;

    uint256 public stakeTotal; // 质押的总数量

    struct Validator {
        uint256 stakeAmount; // 质押数量
        uint256 proportion; // 当前validator质押数量占总质押数量的比重
    }

    bytes[] public validatorList; // 验证节点
    mapping(bytes => Validator) public validators; // 验证机节点详细信息

    // 质押者信息 (质押者地址=> validator公钥 => 数量)
    mapping(address => mapping(bytes => uint256)) public stakers;

    // 只有系统指定地址可以调用
    modifier onlyFromSystem() {
        require(true, "only called by system");
        _;
    }

    // 委托
    // 质押都有哪些步骤？是不是先委托，然后去质押？？？ 委托可以理解为把某个用户资产委托给某个节点（validator）？ 质押可以理解为节点把资产质押挖矿？
    // 一个validator 是否可以同时存在多个委托？？？ 不能的话就要判断
    // 委托质押有没有数量多少限制？？？
    // 这个委托是某个用户把资产委托给某个validator吗？？？ 把钱打到黑洞地址，然后给validator和用户份额加上去？？？
    // 李跃写的那个staking，没有delegate，好像是把功能一块写到stake了？？？
    function delegate() external {}

    // 解除委托
    function unDelegate() external {}

    // 获取委托信息
    function getDelegationInfo(bytes calldata validatorPublicKey) public {}

    // 质押
    function stake(bytes calldata validatorPublicKey) external payable {
        // 更新validator质押比例
        _updateValidatorProportion();
    }

    // 解除质押
    // 解除质押，需要有记录吗？？？
    function unStake(bytes calldata validatorPublicKey, uint256 amount)
        external
    {
        _unStakeFrom(msg.sender, validatorPublicKey, amount);
    }

    // 解除质押
    function _unStakeFrom(
        address staker,
        bytes memory validator,
        uint256 amount
    ) internal {
        stakers[staker][validator] -= amount;
        validators[validator].stakeAmount -= amount;

        Undelegation storage undelegation = _undelegations[staker][validator];
        undelegation.undelegateQueue.push(
            OpUndelegate({amount: amount, height: block.number})
        );

        emit Unstaked(staker, validator, amount);
    }

    // 取回质押FRA
    function claim() public {}

    // 违规处罚
    function penalise() public onlyFromSystem {}

    // 分配质押奖励
    // 质押奖励方法在什么时候触发调用？？？
    function reward() public onlyFromSystem {}

    // 更新validator质押比例
    function _updateValidatorProportion() internal {
        for (uint256 i; i < validatorList.length; i++) {
            validators[validatorList[i]].proportion =
                (validators[validatorList[i]].stakeAmount * (10**18)) /
                stakeTotal;
        }
    }

    // 更新单个validator质押比例
    //    function _updateValidatorProportion(bytes validatorPublicKey) internal onlyFromSystem {}

    // 添加validator
    function addValidator(bytes calldata validatorPublicKey)
        public
        onlyFromSystem
    {
        validatorList.push(validatorPublicKey);
        validators[validatorPublicKey] = Validator(0, 0);
    }

    // 移除validator
    // 当validator质押数量不为0的时候，能否移除validator ???
    function removeValidator(bytes calldata validatorPublicKey)
        public
        onlyFromSystem
    {
        for (uint256 i; i < validatorList.length; i++) {
            if (keccak256(validatorList[i]) == keccak256(validatorPublicKey)) {
                delete validatorList[i];
                delete validators[validatorPublicKey];
            }
            break;
        }
    }

    // 获取validator信息
    function validatorInfo(bytes calldata validatorPublicKey)
        public
        view
        returns (Validator memory)
    {
        return validators[validatorPublicKey];
    }
}
