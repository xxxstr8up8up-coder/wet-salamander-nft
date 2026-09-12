# Etherscan Logo Submission Guide

## 🎨 Add Your Token Logo to Etherscan

### Step 1: Upload Logo to IPFS

1. **Sign up on Pinata:** https://pinata.cloud
2. **Upload your logo:**
   - Click "Upload"
   - Select `assets/wet-salamander-logo.png`
   - Click "Upload"
3. **Get IPFS hash:**
   - Copy the CID (e.g., `QmXXX...`)
   - Your URL: `https://gateway.pinata.cloud/ipfs/QmXXX`

### Step 2: Verify Contract on Etherscan

1. Go to your contract on Sepolia Etherscan:
   ```
   https://sepolia.etherscan.io/address/YOUR_CONTRACT_ADDRESS
   ```

2. Click **"Contract"** tab
3. Click **"Verify & Publish"**
4. Choose compiler version (0.8.20)
5. Paste your contract source code
6. Complete verification

### Step 3: Submit Logo

1. Once verified, go to **"More Info"** section
2. Click **"Update Token Info"** or **"Edit"**
3. In **"Token Logo"** field, paste:
   ```
   https://gateway.pinata.cloud/ipfs/QmXXX
   ```
4. Submit for approval

### Step 4: MetaMask Integration

Once Etherscan approves, MetaMask will automatically display your logo!

---

## 📋 Logo Requirements

- **Format:** PNG or SVG
- **Size:** 256x256px minimum
- **Background:** Transparent (PNG) or white
- **File size:** < 200KB
- **Colors:** Clear, visible design

---

## ✅ Checklist

- [ ] Token deployed to Sepolia
- [ ] Logo uploaded to Pinata IPFS
- [ ] Contract verified on Etherscan
- [ ] Logo URL submitted to Etherscan
- [ ] Logo appears in MetaMask
- [ ] Logo visible on Etherscan token page

---

## 🔗 Links

- **Your Contract:** https://sepolia.etherscan.io/token/YOUR_TOKEN_ADDRESS
- **Pinata:** https://pinata.cloud
- **IPFS Gateway:** https://gateway.pinata.cloud
- **MetaMask:** https://metamask.io
