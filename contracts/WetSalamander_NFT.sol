// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/**
 * @title WetSalamander NFT
 * @dev NFT collection for WET Salamander art
 * Symbol: WET
 * Collection name: Wet Salamander
 */
contract WetSalamander is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    string public baseURI;
    uint256 public maxSupply;
    uint256 public mintPrice = 0.01 ether; // Adjust as needed

    event NFTMinted(address indexed to, uint256 indexed tokenId);
    event MintPriceUpdated(uint256 newPrice);

    constructor(string memory _baseURI, uint256 _maxSupply) 
        ERC721("Wet Salamander", "WET") {
        baseURI = _baseURI;
        maxSupply = _maxSupply;
    }

    /**
     * @dev Mint an NFT (owner only)
     * @param to Address to mint to
     * @param uri Token URI
     */
    function safeMint(address to, string memory uri) public onlyOwner {
        require(_tokenIdCounter.current() < maxSupply, "Max supply reached");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        emit NFTMinted(to, tokenId);
    }

    /**
     * @dev Mint multiple NFTs at once (owner only)
     * @param addresses Array of addresses to mint to
     * @param uris Array of token URIs
     */
    function batchMint(address[] calldata addresses, string[] calldata uris) 
        public onlyOwner {
        require(addresses.length == uris.length, "Array length mismatch");
        for (uint256 i = 0; i < addresses.length; i++) {
            safeMint(addresses[i], uris[i]);
        }
    }

    /**
     * @dev Update the mint price
     * @param newPrice New price in wei
     */
    function setMintPrice(uint256 newPrice) public onlyOwner {
        mintPrice = newPrice;
        emit MintPriceUpdated(newPrice);
    }

    /**
     * @dev Update base URI
     * @param newBaseURI New base URI
     */
    function setBaseURI(string memory newBaseURI) public onlyOwner {
        baseURI = newBaseURI;
    }

    /**
     * @dev Get total minted NFTs
     */
    function getTotalMinted() public view returns (uint256) {
        return _tokenIdCounter.current();
    }

    /**
     * @dev Withdraw contract balance (owner only)
     */
    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No balance to withdraw");
        (bool success, ) = payable(owner()).call{value: balance}("");
        require(success, "Withdrawal failed");
    }

    // Override required functions
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId,
        uint256 batchSize
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
