// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract SingleQuestionVoting {
    // Variables of the contract
    string public Question;
    uint public YesCount;
    uint public NoCount;

    mapping(address => bool) public hasVoted; 

    uint public TotalDonations;

    // Events of the contract
    event VoteCast(address voter, bool voteYes);
    event DonationReceived(address from, uint amount);

    // Constructor
    constructor(string memory _question) {
        require(bytes(_question).length > 0, "Question cannot be empty");
        Question = _question;
        
    }

    // Functions
    // External functions

    function Vote(bool voteYes) external {
        require(hasVoted[msg.sender] == false, "You already voted");
    
    hasVoted[msg.sender] = true;

    if (voteYes) {
        YesCount += 1;
    }
    else {
        NoCount += 1;
    }
    
    emit VoteCast(msg.sender, voteYes);
    }

    function donate() external payable {
        require(msg.value > 0, "You must send some ETH");
        TotalDonations += msg.value;
        emit DonationReceived(msg.sender, msg.value);
    }
    
    // Public functions

    function GetResults() public view returns (uint yes, uint no) {
        return (YesCount, NoCount);
    }
}
