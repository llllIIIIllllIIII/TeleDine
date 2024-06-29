// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//ERC20
import "@openzeppelin\contracts\token\ERC20\ERC20.sol";
import "@openzeppelin\contracts\token\ERC20\IERC20.sol";

contract XUE is ERC20 {


    constructor(uint256 initialSupply) ERC20("XUE", "XUE")  {
        _mint(msg.sender, initialSupply);
    }

    function mint(address account, uint256 amount) public  {
        _mint(account, amount);
    }

}