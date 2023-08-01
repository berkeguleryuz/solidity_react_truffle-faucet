// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// they can not inherit from other smart contracts
// they can only inherit from other interfaces

// They can not declare a constructor
// They can not declare state variables
// all declared functios have to be external 

interface IFaucet {

    function addFunds() external payable; 
    function withdraw(uint withdrawAmount) external; 
}