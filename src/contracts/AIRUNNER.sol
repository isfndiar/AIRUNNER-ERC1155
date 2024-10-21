// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Pausable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/utils/Strings.sol"; 
import "@openzeppelin/contracts/finance/PaymentSplitter.sol";

contract AIRUNNER is ERC1155, Ownable, ERC1155Pausable, ERC1155Supply, PaymentSplitter {
    uint256 public publicPrice = 0.01 ether;
    uint256 public MAX_SUPPLY = 100;
    uint256 public maxPerWallet = 3;
    mapping(address => uint256) public purchaseWallet;
    constructor(address[] memory _payees, uint256[] memory _shares)  
    ERC1155("ipfs://QmbSCuKNhm2f98L5U9ZsniT3QRL7MsC3cofeyf26kgyRH1/") 
    Ownable(msg.sender) 
    PaymentSplitter(_payees, _shares)   {}

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint( uint256 id, uint256 amount)
        public payable 
    {
        require(purchaseWallet[msg.sender] + amount <= maxPerWallet, "max nft that you mint is 3");
        require(id < 3, "Sorry looks like you are trying to mint the wrong nft");
        require(msg.value == 0.01 ether * amount, "not enough money");
        require(totalSupply(id) + amount <= MAX_SUPPLY, "we have minted out");
        purchaseWallet[msg.sender] += amount;
        _mint(msg.sender, id, amount, "");
    }



function uri(uint256 _id) public view virtual override returns (string memory) {
    require(exists(_id), "URI: nonexistent token");
    return string(abi.encodePacked(
        super.uri(0), // This returns the base URI
        Strings.toString(_id), 
        ".json"
    ));
}


    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256[] memory ids, uint256[] memory values)
        internal
        override(ERC1155, ERC1155Pausable, ERC1155Supply)
    {
        super._update(from, to, ids, values);
    }
}
