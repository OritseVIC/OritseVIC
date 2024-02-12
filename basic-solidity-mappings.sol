//SPDX-License-Identifier: MIT

pragma solidity >= 0.7.0 < 0.9.0; 

//BASIC SOLIDITY MAPPINGS

//A mapping is a data structure in the form of a dictionary of keys with each key matching a certain value

//so imagine we have favoriteNumbers at our disposal but we cannot seem to find the right username to match with their favoriteNumber

contract learnMappings{

    uint256 favoriteNumber;

//The mapping below is named "nameMatchedToFavoriteNumber". In this case, it maps string keys (names) to uint256 values (favorite numbers). 
//And it works essentially like a dictionary or an associative array where you can match a favoriteNumber to its key owner or username 
//or address (as the case always is in smart contracts)

//So "_name" is the key used to access the value in the mapping. Since nameMatchedToFavoriteNumber maps the string to uint256, 
//_name is used as the key to access the corresponding favorite number that we had trouble accessign because we initially couldn't find its key name.
    mapping (string => uint256) public nameMatchedToFavoriteNumber;

     
//The struct People2 defines a custom data structure with two properties: favoriteNumber of type uint256 
//and name of type string.
    struct People2{
        uint256 favoriteNumber;
        string name;
    }
 
    People2[] public persons; //"People2[] public persons;" declares an array named persons of type People2[], the struct below. 
//This array is declared as public, which means it can be accessed from outside the contract.


//The addPerson function allows adding a new person to the persons array. It takes two arguments:
// _favoriteNumber and _name, representing the favorite number and name of the person, respectively.
    function addPerson(uint256 _favoriteNumber, string memory _name) public{
        persons.push(People2(_favoriteNumber, _name));
        nameMatchedToFavoriteNumber[_name] = _favoriteNumber; 
//This code updates the "nameMatchedToFavoriteNumber" mapping by assigning the _favoriteNumber to _name as key.
//This effectively stores the favorite number for a given name. 
//This allows for easy lookup of favorite numbers based on names in the Solidity contract, hence its dictionary status
    }
}
