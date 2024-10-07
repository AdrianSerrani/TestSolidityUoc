// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MessageRegistry {

    // State variables
    string private message;
    address private owner;

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can execute this function");
        _;
    }

    // Constructor to set the owner when the contract is deployed
    constructor() {
        owner = msg.sender;
    }

    // Function to store a new message, only callable by the owner
    function storeMessage(string memory newMessage) public onlyOwner {
        message = newMessage;
    }

    // Function to retrieve the stored message
    function retrieveMessage() public view returns (string memory) {
        return message;
    }
}
