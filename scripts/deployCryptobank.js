async function main() {
    const Cryptobank = await ethers.getContractFactory("Cryptobank");
    const Cryptobank = await Cryptobank.deploy("My Contract");
  
    console.log("My Contract deployed to:", Cryptobank.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
  });