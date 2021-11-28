// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

interface I_Faucet {
    function getTokens() external;
}

interface I_Token {
    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address account) external view returns (uint256);
}

interface I_Home {
    function registerAsStudent(string memory name) external;
}

contract HomeTask2 {
    address contractFaucet = 0x3F586f62F4baeB081Cc4861E82c7b27D51a8904D;
    address contractHomeToken = 0xA8BFa2DEf58e0fce3c4293411249504C3AD9EbB4;
    address contractHome = 0x0E822C71e628b20a35F8bCAbe8c11F274246e64D;

    function faucet() public {
        I_Faucet(contractFaucet).getTokens();
    }

    function approve() public {
        uint256 balance = I_Token(contractHomeToken).balanceOf(address(this));
        require(balance > 0, "Amount zero!");
        I_Token(contractHomeToken).approve(contractHome, balance);
    }

    function registerAsStudent(string memory name) public {
        uint256 balance = I_Token(contractHomeToken).balanceOf(address(this));
        require(balance > 0, "Amount zero!");
        I_Home(contractHome).registerAsStudent(name);
    }
}
