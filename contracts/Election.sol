pragma solidity >=0.4.21 <0.7.0;

contract Election{
    // model a condidate 
    struct Candidate{
      uint id;
      string name;
      uint voteCount;
    }
    // store accounts that have voted
    mapping(address => bool) public voters;
   // store a candiate 
   // fetch candidate 
    mapping(uint => Candidate) public candidates;
    // store candidate count
   uint public candidatesCount;

    constructor() public{
      addCandidate("candidate 1");
      addCandidate("candidate 2");
    }

    function addCandidate (string memory _name) private {
      candidatesCount++;
      candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    }
    
    function vote (uint _candidateId) public {
      // address has not voted before
      require(!voters[msg.sender]);
      // voting for valid candidate
      require(_candidateId>0 && _candidateId<=candidatesCount);
      // update the voter has voted
      voters[msg.sender] = true;
      //update the votes of candidate
      candidates[_candidateId].voteCount ++;
    }

}