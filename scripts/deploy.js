const hre = require("hardhat");
require("dotenv").config();

async function main() {
  console.log("🚀 Starting deployment to Sepolia...");
  console.log("Network:", hre.network.name);

  // Get deployer account
  const [deployer] = await ethers.getSigners();
  console.log(`📋 Deploying with account: ${deployer.address}`);

  // Get account balance
  const balance = await deployer.getBalance();
  console.log(`💰 Account balance: ${ethers.formatEther(balance)} ETH`);

  if (balance === 0n) {
    throw new Error("❌ Insufficient balance! Get Sepolia ETH from faucet.");
  }

  // Deploy WetSalamander Token (ERC20)
  console.log("\n📦 Deploying WetSalamander Token (ERC20)...");
  try {
    const WetSalamander = await ethers.getContractFactory("WetSalamander");
    const wetToken = await WetSalamander.deploy();
    await wetToken.waitForDeployment();
    const tokenAddress = await wetToken.getAddress();
    console.log(`✅ WetSalamander Token deployed to: ${tokenAddress}`);
    console.log(`🔗 View on Etherscan: https://sepolia.etherscan.io/token/${tokenAddress}`);
  } catch (error) {
    console.error("❌ Failed to deploy WetSalamander Token:", error.message);
    throw error;
  }

  // Deploy WetSalamander NFT (ERC721)
  console.log("\n🎨 Deploying WetSalamander NFT (ERC721)...");
  try {
    const baseURI = "ipfs://QmXXX/"; // Replace with your IPFS hash
    const maxSupply = 10000; // Max 10,000 NFTs
    
    const WetSalamanderNFT = await ethers.getContractFactory("WetSalamander", {
      contractName: "WetSalamander_NFT"
    });
    
    // Use the NFT contract
    const artifacts = await hre.artifacts.readArtifact("WetSalamander_NFT");
    const WetSalamanderNFT_Factory = await ethers.getContractFactory(
      artifacts.abi,
      artifacts.bytecode
    );
    
    const nftContract = await WetSalamanderNFT_Factory.deploy(baseURI, maxSupply);
    await nftContract.waitForDeployment();
    const nftAddress = await nftContract.getAddress();
    console.log(`✅ WetSalamander NFT deployed to: ${nftAddress}`);
    console.log(`🔗 View on Etherscan: https://sepolia.etherscan.io/address/${nftAddress}`);
  } catch (error) {
    console.error("⚠️  NFT deployment skipped (may be optional)");
  }

  console.log("\n✨ Deployment complete!");
  console.log("\n📊 Summary:");
  console.log(`   Deployer: ${deployer.address}`);
  console.log(`   Network: ${hre.network.name}`);
  console.log(`   Chain ID: ${(await ethers.provider.getNetwork()).chainId}`);
  console.log("\n🔍 Check your contracts on Etherscan:");
  console.log("   https://sepolia.etherscan.io/");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("❌ Deployment failed:", error);
    process.exit(1);
  });
