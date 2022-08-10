
测试账户12:
0x3bd1a4c59b575eC77dDBd9c9c0a46633E5D5Bec7
8699040b13da6c1994f97bef8d2fe458bf5c23e6ca5a97d45bd4663eaf90b856
测试账户13:
0x8f03D4Ce81C3c2dB006C1C725d2e70C3ecC69916
c813f8c65d2c26c019bdf65b64fd55128d27180d9f080f5d1d3e4729a1d4b5d3
VALIDATOR bytes32   :           0xa95257aebefccffaada4758f028bce81ea992693be70592f620c4c9a0d9e715a
MINTER_ROLE bytes32 :           0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6
resourceID		    :	        0x3565375400000000000000000000000000000000000000000000000000000000
manager_address     :           0x75483a611fd927ca3f0ef314a5594ff61a87e4fc

Ropsten:
bridge:                         0x213e58270647804E8022853a3384d8055B29868E
ERC20P:                         0x78F34B92Ad988e981fA5D888Dcf192DC6bbbE5D4
R20A:                           0x534c72af02b6Cefc775495192439D7cFe80d0ec7
R721A:                          0x941D08391cCB4381d3863211B0AA347022C04bFb
Rp721A:                         0xc77aa1A7C1c8d3330BAC4EA626D5B378b1cCd6ea
R1155A:                         0x0b105Cd1bcBB0A63E71eee895101b199FF3BB4Cb

Goerli:
bridge:                         0x606fdB397009dd528A972d9D19198cf27d0Bc83A
ERC20P:                         0x4c45b13Ac8e6d205B63944c028F7DfB586859414
G20A:                           0xC8bb9238AD827c6dE6dDb154D7A5DFDaaB99Bce6
G721A:                          0x581B2a391425A235d6a6c6c3F247703F76ce819C
Gp721A:                         0x66b43394b50Cc1D6260A77D3c7C5a9A6C159C832
G1155A:                         0x8e5bf60141C37dCB0e0564fe6E80e0cfEc3b61DF

resourceID1	:	R20A->G20A     0x3565375400000000000000000000000000000000000000000000000000000001
                                erc20Handler:
                                    Ropsten:   0x736F3cC805C171539Fb602Ff712CFA53eFd62EE9
                                    Goerli:    0x3CfE2d037c3a4Ea5D0a97812da59761dBA298dB9

resourceID3	:	R721A->G721A    0x3565375400000000000000000000000000000000000000000000000000000003
                                erc721Handler:
                                Ropsten:   0x4Cf606a11896199Dd714d3B99bFF23FD69C7Ec2F
                                Goerli:    0x1609ac56e2ccEa518B0beB3d61Bf862bC3489eA9

resourceID4	:	Rp721A->Gp721A  0x3565375400000000000000000000000000000000000000000000000000000004
                                erc721Handler:
                                Ropsten:   0xf8c122e0911771104eF17843287081a1AdfB59E2
                                Goerli:    0x941eE13eFC984BeF4bEC6c20040dFc32919A10cC

resourceID5	:Rp1155A->Gp1155A   0x3565375400000000000000000000000000000000000000000000000000000005
                                erc1155Handler:
                                Ropsten:   0x767E603E89bC094d0F3F503C9b24Fa0c2638b14D
                                Goerli:    0x63AcF45F0DD7aEaa8ad3D9Db23D030C9f083E76f

resourceID7	:ETH->G20A          0x3565375400000000000000000000000000000000000000000000000000000007
                                nativeToERC20Handler:
                                Ropsten:   0x1556f866a27cf82cb9fc76e810945baa3e818e17
                                Goerli:    0x60afa3abbd46cb95614107d81d5dedb5b150da04








需要给目标链的handler打钱或者赋予minter角色
erc20跨链前要先admin账户对handler 进行 approve，可以用 increaseAllowance

erc20burnable 调用者对handler（spender） approve





