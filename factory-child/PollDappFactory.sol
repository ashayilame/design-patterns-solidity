// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;
import "./polling-dapp.sol";

contract PollDappFactory {
    PollDapp[] public pollDappInstance;
    address payable owner; //contract creator's address

    constructor() {
        owner = payable(msg.sender);
    }

    function createPollDappInstance(string memory _question, string[] memory _options) payable public returns (string memory) {
        require(msg.value == 1 ether);
        PollDapp _temp = new PollDapp(_question,_options);
        pollDappInstance.push(_temp);
        return "done";
    }

    function getAllInstances() public view returns (PollDapp[] memory) {
        return pollDappInstance;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdraw() public {
        require(msg.sender == owner);
        owner.transfer(address(this).balance);
    }
}
