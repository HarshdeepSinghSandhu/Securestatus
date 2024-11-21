// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Status {
    
    mapping(address => string) private statuses;

    event StatusUpdated(address indexed user, string newStatus);
    event StatusDeleted(address indexed user);

    function setStatus(string memory newStatus) public {
        require(bytes(newStatus).length > 0, "Status cannot be empty");
        require(bytes(newStatus).length <= 256, "Status is too long");
        
        statuses[msg.sender] = newStatus;

        emit StatusUpdated(msg.sender, newStatus);
    }

    function getStatus(address user) public view returns (string memory) {
        return statuses[user];
    }

    function deleteStatus() public {
        require(bytes(statuses[msg.sender]).length > 0, "No status to delete");
        
        
        delete statuses[msg.sender];

        
        emit StatusDeleted(msg.sender);
}
}