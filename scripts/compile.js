const hre = require("hardhat");

async function main() {
  console.log("🔧 Compiling contracts...");
  await hre.run("compile");
  console.log("✅ Compilation successful!");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("❌ Compilation failed:", error);
    process.exit(1);
  });
