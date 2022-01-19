// SPDX-License-Identifier: UNLICENSED;

pragma solidity >=0.7.0 <0.9.0;

contract Cryptobank {
    mapping(address => uint256) balance;

    event depositDone(uint256 amount, address indexed depositedTo);

    function deposit() public payable returns (uint256) {
        balance[msg.sender] += msg.value;
        emit depositDone(msg.value, msg.sender);
        return balance[msg.sender];
    }

    function withdraw(uint256 amount) public returns (uint256) {
        require(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;
        msg.sender.transfer(amount);
        return balance[msg.sender];
    }

    function getBalance() public view returns (uint256) {
        return balance[msg.sender];
    }

    function transfer(address recipient, uint256 amount) public {
        require(balance[msg.sender] >= amount, "Insufficient Balance");
        require(
            msg.sender != recipient,
            "Prohibited Transaction: You can not send funds to yourself."
        );

        uint256 previousSenderBalance = balance[msg.sender];

        _transfer(msg.sender, recipient, amount);

        assert(balance[msg.sender] == previousSenderBalance - amount);
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) private {
        balance[from] -= amount;
        balance[to] += amount;
    }
}
