// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Storage {
    mapping(uint => uint) public aa; // slot 0
    mapping(address => uint) public bb; // slot 1

    uint[] public cc;

    uint8 public a = 7;
    uint16 public b = 10;
    address public c = 0x241be09d5354c1c9b207C16cA919d8B9952bc6f2;
    bool d = true;
    uint64 public e = 15;

    // 32 bytes, all values will be stored in slot 2
    // 0x000000000000000f01241be09d5354c1c9b207c16ca919d8b9952bc6f2000a07
    uint256 public f = 200; // 32 bytes => slot 3

    uint8 public g = 40; // 1 byte => slot 4

    uint256 public h = 789; // 32 bytes => slot 5

    constructor() {
        cc.push(1);
        cc.push(10);
        cc.push(100);
        aa[2] = 4;
        aa[3] = 10;

        bb[0x241be09d5354c1c9b207C16cA919d8B9952bc6f2] = 100;
    }
}
