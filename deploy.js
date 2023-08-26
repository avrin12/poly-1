const hre = require("hardhat");

async function main() 
{
  const token = await hre.ethers.deployContract("Token");
  console.log("Token address is:", await token.getAddress());
}

main().catch((error) => 
{
  console.error(error);
  process.exitCode = 1;
});
