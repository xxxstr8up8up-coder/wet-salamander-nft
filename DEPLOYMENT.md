# 🦎 WET Salamander NFT - Sepolia Deployment Guide

## 📋 Your Wallet Address
```
0x0f8b188313d6870abff03a6735f2473700875163
```

## 🚀 Setup Instructions

### Step 1: Install Dependencies
```bash
npm install
```

### Step 2: Get Sepolia Testnet ETH
1. Visit: **https://sepoliafaucet.com**
2. Paste your wallet address: `0x0f8b188313d6870abff03a6735f2473700875163`
3. Claim free Sepolia ETH
4. Wait for confirmation (usually instant)

### Step 3: Get Alchemy RPC URL (FREE)
1. Go to: **https://www.alchemy.com/**
2. Sign up (free)
3. Create a new app
4. Select **Ethereum** → **Sepolia**
5. Copy your API key

### Step 4: Configure `.env` File
```bash
cp .env.example .env
```

Edit `.env` with your values:
```env
SEPOLIA_RPC_URL=https://eth-sepolia.alchemyapi.io/v2/YOUR_ALCHEMY_KEY
PRIVATE_KEY=your_metamask_private_key_here
```

**⚠️ How to get your Private Key from MetaMask:**
1. Open MetaMask
2. Click account menu (top right)
3. Account Details → Export Private Key
4. Paste it in `.env` (include `0x` prefix)
5. **NEVER share this key!**

### Step 5: Compile Contracts
```bash
npm run compile
```

### Step 6: Deploy to Sepolia
```bash
npm run deploy:sepolia
```

✅ Your contracts will deploy and addresses saved to `deployments/sepolia.json`

---

## 📍 Verify on Etherscan

After deployment:
1. Go to: **https://sepolia.etherscan.io**
2. Paste your contract address
3. View your deployed contract!

---

## 🎯 What Gets Deployed

### WetSalamander (ERC20 Token)
- Name: WET Salamander
- Symbol: WET
- Total Supply: 1,000,000,000 tokens
- Deployed to your wallet

### WetSalamander (ERC721 NFT)
- Name: Wet Salamander
- Symbol: WET
- Max Supply: 10,000 NFTs
- Owner: Your wallet address

---

## 🔗 Useful Links

- Sepolia Faucet: https://sepoliafaucet.com
- Alchemy (RPC): https://www.alchemy.com
- Etherscan (Explorer): https://sepolia.etherscan.io
- MetaMask: https://metamask.io

---

## ⚠️ Security Reminders

- 🔐 **Never commit `.env` file**
- 🔐 **Never share private key**
- 🔐 **Keep private key secure**
- 🔐 **Test on testnet first**

---

**Ready to deploy? Let's go! 🚀🦎**
