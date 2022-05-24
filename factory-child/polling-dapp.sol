// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract PollDapp {
    string public question;
    string[] options;
    mapping(uint => uint) public voteCount; // key (index of option) : value (votes of option)
    mapping(address => uint) public castedVotes;
    constructor (string memory _question, string[] memory _options) {
        question = _question;
        options = _options;
    }

    function getOptions() public view returns (string[] memory){
        return options;
    }

    function castVote (uint _optionIndex) public returns (string memory) {
        require(castedVotes[msg.sender] == 0, "Error: You can only cast once");
        address _caller = msg.sender;

        uint existingNumberOfVotes = voteCount[_optionIndex];
        uint updatedNumberOfVotes = existingNumberOfVotes + 1;

        uint existingVotesByCaller = castedVotes[_caller];

        uint updatedVotesByCaller = existingVotesByCaller + 1;

        voteCount[_optionIndex] = updatedNumberOfVotes;
        castedVotes[_caller] = updatedVotesByCaller;

        return "Congrats, Your Vote is counted";
    }
}
