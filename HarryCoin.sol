pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract HarryCoin is ERC20 {
    constructor(uint256 initialSupply) ERC20("Harry Coin", "HRC") {
        _mint(msg.sender, (initialSupply * (uint256(10) ** 18)));
    }
}
