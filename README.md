# AIRUNNER - NFT Project on ERC1155

**AIRUNNER** is an NFT smart contract built using Solidity. This project implements functionalities for NFT minting. The project is developed and tested using the Hardhat framework.

see in [testnet opensea](https://testnets.opensea.io/collection/airunner)

# Preview

## NFTs on OpenSea

<img src="public/airunner-preview.png" alt="Airunner Collection on OpenSea" width="500">
<img src="public/airunner-preview2.png" alt="Airunner NFT on OpenSea" width="500">

## Features

- **Mint**: all users can mint NFTs.

- **NFT Ownership**: Ensures proper ownership and transfer functionality for minted NFTs.

## Prerequisites

Make sure you have the following tools installed:

- [Node.js](https://nodejs.org/)
- [Hardhat](https://hardhat.org/)
- [Solidity](https://docs.soliditylang.org/)
- [MetaMask](https://metamask.io/) (for interacting with the contract)

## Getting Started

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/isfndiar/AIRUNNER-ERC1155.git
   cd AIRUNNER-ERC1155
   ```

2. Install the dependencies:

   ```bash
   npm install
   ```

3. Install Hardhat if you haven't already:

   ```bash
   npm install --save-dev hardhat
   ```

4. Install additional Hardhat plugins:

   ```bash
   npm install @nomiclabs/hardhat-ethers @openzeppelin/contracts
   ```

### Compiling the Contract

Compile your smart contract using Hardhat:

```bash
npx hardhat compile
```

### Interacting with the Contract

Once the contract is deployed, you can interact with it using Hardhat tasks, scripts, or through the command line.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to modify it according to your project specifics!
