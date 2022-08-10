const {expect} = require("chai");
const {ethers} = require("hardhat");

describe("Bridge", function () {
    it("Should return the new manager once it's changed", async function () {
        const Bridge = await ethers.getContractFactory("Bridge");
        const bridge = await Bridge.deploy(1, 2);

        // adminSetChainId
        await bridge.adminSetChainId(2)
        expect(await bridge.chainId()).to.equal(2);

        // adminSetSignatureThreshold
        await bridge.adminSetSignatureThreshold(2)
        expect(await bridge.signatureThreshold()).to.equal(2);

        // grantRole
        await bridge.grantRole(
            "0xa95257aebefccffaada4758f028bce81ea992693be70592f620c4c9a0d9e715a",
            "0x8f03D4Ce81C3c2dB006C1C725d2e70C3ecC69916"
        )
        await bridge.grantRole(
            "0xa95257aebefccffaada4758f028bce81ea992693be70592f620c4c9a0d9e715a",
            "0x3bd1a4c59b575eC77dDBd9c9c0a46633E5D5Bec7"
        )
        expect(await bridge.getRoleMemberCount("0xa95257aebefccffaada4758f028bce81ea992693be70592f620c4c9a0d9e715a")).to.equal(2);

        // callRemote
        expect(await bridge.callRemote(
            "0x3565375400000000000000000000000000000000000000000000000000000000",
            1,
            "0xca98cd464a9cc69409de5bfec896a45985f670a3",
            "0x3565375400000000000000000000000000000000000000000000000000000000")
        ).to.emit("", "CallRequest");

        // execute
        await bridge.execute(
            "0x3565375400000000000000000000000000000000000000000000000000000000",
            2,
            100,
            "0xeea2de07b82c8f39072420f0c80b11f0670f41aacbfc93f9a7d100cca284c117",
            1,
            "0xca98cd464a9cc69409de5bfec896a45985f670a3",
            "0x3565375400000000000000000000000000000000000000000000000000000000",
            ["0xe25de3e21929d4d90289ae95ab55d20efe5aff86ae3920d5d9c61111c3ebccde1d63c7a371315dd77c33c2e15907bfd7547807fa3f9df84ce1b0ab5c76b137901b","0x15918b2c5a99e80976466b8e062d6774b030af40679c9dae640b9641b172f72f5ae2fadc4ad866ac43432db7eff5f3ec6141e54bfa45c8d06677194440fe082c1b"],
        );
        expect(await bridge.executionRecord["0xeea2de07b82c8f39072420f0c80b11f0670f41aacbfc93f9a7d100cca284c117"] === true)

    });
});