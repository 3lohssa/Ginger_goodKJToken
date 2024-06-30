// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../lib/contracts/token/ERC20/ERC20.sol";

// 定義一個代幣合約
contract KJToken is ERC20 {
    // 燃燒事件
    event Burn(address indexed from, uint256 value);

    // 構造函數，設定初始供應量
    constructor(
        uint256 initialSupply,
        address initialAccount
    ) ERC20("KJToken", "KJ") {
        // 將所有初始代幣分配給指定的初始賬戶
        _mint(initialAccount, initialSupply * 10 ** decimals());
    }

    // 燃燒函數
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
        emit Burn(msg.sender, amount);
    }

    // 由監管地址燃燒代幣
    function burnFrom(address account, uint256 amount) public {
        uint256 currentAllowance = allowance(account, msg.sender);
        require(
            currentAllowance >= amount,
            "ERC20: burn amount exceeds allowance"
        );
        _approve(account, msg.sender, currentAllowance - amount);
        _burn(account, amount);
        emit Burn(account, amount);
    }
}
