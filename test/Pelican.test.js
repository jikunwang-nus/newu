const { expect } = require("chai");

describe("Token contract", function () {
  it("Deployment should assign the total supply of tokens to the owner", async function () {
    const [owner] = await ethers.getSigners();

    const hardhatToken = await ethers.deployContract("Pelican");

    const ownerBalance = await hardhatToken.balance(owner.address);
    expect(await hardhatToken.totalToken()).to.equal(ownerBalance);
  });
});
