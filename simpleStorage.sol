// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract SimpleStorage {

  uint256 favoriteNumber; // <- storage, not defined in functions
  //People public person = People({favoriteNumber: 2, name: "Paul"});
  
  mapping(string => uint256) public nameToFavoriteNumber;
  
  People[] public people;
  //0:person1, 1: person2 ...

  struct People {
    uint256 favoriteNumber;
    string name;
  }

  function store(uint256 _favoriteNumber) public {
    favoriteNumber = _favoriteNumber;
  }

  function retrieve() public view returns (uint256){
        return favoriteNumber;
    }
  
  //call data, memory -> temporary exist,storage exist out side function executing
  //data stored in memory can be modified, calldata cannot be changed
  //no need to specify where uint data type stay
  function addPerson(string memory _name, uint256 _favoriteNumber) public {
    people.push(People(_favoriteNumber, _name));
    nameToFavoriteNumber[_name] = _favoriteNumber;
  }


}
