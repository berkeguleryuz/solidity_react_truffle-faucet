// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Owned.sol";
import "./Logger.sol";
import "./IFaucet.sol";

contract Faucet is Owned, Logger, IFaucet {
    // storage variables
    // uint public funds = 1000; // positive values only

    // funds [0xx...] = 500
    // funds [0xb1...] = 300
    // funds [0xb2...] = 200

    // this is a special function
    // it's called when you make a tx that doesn't specify a value
    // function name to call

    // External functions are part of the contract interface
    // which means they can be called via contracts and other tx

    uint public numOfFunders;

    mapping(address => bool) private funders;
    mapping(uint => address) private lutFunders;

    modifier limitWithdraw(uint withdrawAmount) {
        require(
            withdrawAmount <= 100000000000000000,
            "Cannot withdraw more than 0.1 ether"
        );
        _;
    }

    receive() external payable {}

    function emitLog() public pure override returns (bytes32) {
        return "Hello World";
    }

    // private => can be accesible only within the smart contract
    // internal => can be accessible within smart contract and also derived smart contract

    function addFunds() external payable override {
        address funder = msg.sender;
        test3();

        if (!funders[funder]) {
            uint index = numOfFunders++;
            funders[funder] = true;
            lutFunders[index] = funder;
        }
    }

    function test1() external onlyOwner {
        // some managing stuff that only admin should have access to
    }

    function test2() external onlyOwner {
        // some managing stuff that only admin should have access to
    }

    function withdraw(
        uint withdrawAmount
    ) external override limitWithdraw(withdrawAmount) {
        payable(msg.sender).transfer(withdrawAmount);
    }

    function getAllFunders() external view returns (address[] memory) {
        address[] memory _funders = new address[](numOfFunders);

        for (uint i = 0; i < numOfFunders; i++) {
            _funders[i] = lutFunders[i];
        }

        return _funders;
    }

    function getFunderAtIndex(uint8 index) external view returns (address) {
        return lutFunders[index];
    }

    // pure, view - read-only call, no gas free
    // view - it indicates that the function will not alter the storage state in any way
    // pure - even more strict, indicating that it won't even read the storage state

    // Transactions (can generate state changes) and require gas fee
    // read-only call, no gas free

    // to talk to the node on the network you can make JSON-RPC http calls
}
// const instance = await Faucet.deployed()
// instance.addFunds({from: accounts[0], value: "2000000000000000000"})
// instance.addFunds({from: accounts[1], value: "2000000000000000000"})

// instance.withdraw("500000000000000000", {from: accounts[1]})

// instance.getFunderAtIndex(0)
// instance.getAllFunders()

// Block info
// Nonce - a hash that when combined with the minHash proofs that
// the block has gone through proof of work
// 8 bytes => 64 bits
