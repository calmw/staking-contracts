
# 三种合约的部署和使用说明

### manager合约
1. 部署合约。
部署时候的两个参数_voteThreshold, _expiry分别为验证通过投票的最少票数限制、从投票开始到结束的区块高度差不能大于该过值（过期的临界值）。_voteThreshold可通过adminSetVoteThreshold重新设置。
2. 将每个用于签名的relayer账户设置为validator角色,并且设置的账户数量 >=_voteThreshold, 增加和移除validator角色的方法分别为：grantRole和revokeRole。
3. 可以对每个resourceID进行单独的配置（比如是否自动执行目标链合约调用等）。通过adminSetConfigResource和getChainConfig来进行设置和获取配置。

1和2为必选项，其他非必须。

### bridge合约
1. 部署合约。 
部署时候的两个参数_chainId, _signatureThreshold分别为当前链的链ID、验证通过签名（来自上一步manager合约投票产生的签名）的最少数量 。可通过adminSetSignatureThreshold重新设置，该值必须满足_signatureThreshold<=_voteThreshold（来自manager合约）。
2. 将relayer账户设置为validator角色，跟manager合约中设置完全相同（账户地址和数量完全一样）。 增加和移除validator角色的方法分别为：grantRole和revokeRole。
3. 可以通过adminSetConfigResource设置当前链的一些配置（比如跨链费用、黑名单等）。
4. 可以通过adminSetChainId设置chainID，建议在部署时候确定好，减少变更。

1和2为必选项，其他非必须。

### handler合约
1. 部署合约。 
部署时候的四个参数_resourceID、_bridgeAddress、 _tokenAddress、_targetHandler、_burnable分别代表resourceID、当前链上部署的bridge合约地址、当前handler要跨链的代币地址（NativeToERC20Handler在源链上该参数可以随意设置）、目标链上对应的handler地址、要跨链的代币是否需要销毁。可通过adminSetConfig重新设置。
2. 每个resourceID在源链和目标链上分别对应一个handler，resourceDI相关设置在manager合约中。

1为必选项，其他非必须。

### 合约中的权限
1. 合约中分为 DEFAULT_ADMIN_ROLE、 MANAGER_ROLE、 VALIDATOR_ROLE 这三种角色，投票相关的操作只能是VALIDATOR_ROLE，合约设置相关的操作DEFAULT_ADMIN_ROLE和MANAGER_ROLE来操作，DEFAULT_ADMIN_ROLE的权限包含MANAGER_ROLE，
2. 在目标链上，还有MINTER_ROLE角色存在于部署好的具有mint功能的ERC721和ERC1155合约中，要给handler赋予该角色。
  具体请参考合约代码



    
