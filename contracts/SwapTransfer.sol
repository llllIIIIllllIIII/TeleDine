// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@uniswap\v2-periphery\contracts\interfaces\IUniswapV2Router02.sol";
//ERC20
import "@openzeppelin\contracts\token\erc20\IERC20.sol";

contract SwapTransfer{

    address tokenA;
    address tokenB;

    constructor(address _tokenA, address _tokenB)  {
        tokenA = _tokenA;
        tokenB = _tokenB;
    }
    


    function swap (uint256 amountOutMin , address to) public returns(uint256){
        uint256 amountIn = getAmountIn(amountOutMin);
        require(IERC20(tokenA).transferFrom(msg.sender, address(this), amountIn), "Transfer of tokenA failed");
        require(IERC20(tokenB).transfer(to, amountOutMin), "Transfer of tokenB failed");
        return amountIn;

    }
    //Get how many amount of tokenA we need to get excact amount of TokenB
    function getAmountIn(uint256 amountOutMin) public view returns(uint256){
        amountA = IERC20(tokenA).balanceOf(address(this));
        amountB = IERC20(tokenB).balanceOf(address(this));
        require(amountA > 0 && amountB > 0, "Token balance in pool isnt sufficient");
        uint256 constK = amountA*amountB;
        uint256 amountIn = (constK / (amountB - amountOut)) - amountA;

        return amountIn;
    }


}