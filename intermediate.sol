// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract project {
    address public client;
    address public freelancer;
    uint256 public price;

    constructor(address _freelancer) payable {
        freelancer = _freelancer;
        client = msg.sender;
        price = msg.value;
    }
    receive() external payable {
        price += msg.value;
    }

    struct Timeline {
        string title;
        uint amount;
        bool locked;
        bool paid;
    }
    Timeline[] public timeline_details;

    modifier onlyFreelancer() {
        require(msg.sender == freelancer, "Only freelancer!!!!");
        _;
    }
    function createTimeline(string memory _title, uint _amt) public onlyFreelancer {
        Timeline memory _timeline_details = Timeline({
            title: _title,
            amount: _amt,
            locked: true,
            paid: false
        });
        timeline_details.push(_timeline_details);
    }
}
