const {expect} = require("chai");
const {ethers} = require("hardhat")
const {arrayify} = require("ethers/lib/utils");

describe("Manager", function () {
    it("Should return the new manager once it's changed", async function () {

        const Manager = await ethers.getContractFactory("Manager");
        const manager = await Manager.deploy(2, 100);

        // adminSetVoteThreshold
        await manager.adminSetVoteThreshold(5)
        expect(await manager.voteThreshold()).to.equal(5);

        // adminSetConfigResource
        await manager.adminSetConfigResource("0x3565375400000000000000000000000000000000000000000000000000000000", true)
        let remoteCallType = await manager.getChainConfig("0x3565375400000000000000000000000000000000000000000000000000000000")
        expect(remoteCallType[0]).to.equal(1);

        // grantRole
        await manager.grantRole(
            "0xa95257aebefccffaada4758f028bce81ea992693be70592f620c4c9a0d9e715a",
            "0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266"
        )
        expect(await manager.getRoleMemberCount("0xa95257aebefccffaada4758f028bce81ea992693be70592f620c4c9a0d9e715a")).to.equal(1);

        manager.signer.signMessage(arrayify("0xeea2de07b82c8f39072420f0c80b11f0670f41aacbfc93f9a7d100cca284c117")).then((s) => {
            console.log("signerAddress: ",manager.signer.getAddress())
            console.log("signature: ",s)
        })

        // vote
        await manager.vote(
            "0x3565375400000000000000000000000000000000000000000000000000000000",
            "0xeea2de07b82c8f39072420f0c80b11f0670f41aacbfc93f9a7d100cca284c117",
            2,
            100,
            1,
            "0xca98cd464a9cc69409de5bfec896a45985f670a3",
            "0x44048b0219b1dd58efe1e473267ace25c3315686dbce16fb63de21f798d6dc28",
            "0x0e2ac44ad9b5af918eefecc1fbf4bac4345674b07157e10db6c574f418bc2b744cac519831a65ddf0003bbac6cc8838c8a66df04f6325130eaa453d79ccc51381c"
        )
    });
});