//SPDX-License-Identifier: MIT

//This code below is shaping up; we can store variables; we can add people; but there is a problem
//what if we hae a ton of people with their favoritenumbers in this list, and we have someone who needs to find their number, which they submitted to this system
//We have a problem of having t keep looping throgh the tons of names in the list to get to a person and their favoriteNumber

//There is a better data structure than a list or an array that makes it easier for us to access this information
//enter MAPPING: a set of keys, with each key returning a special set of information about that key
//In the case below, it can be written out as follows: mapping(string => uint256) public nameToFavoriteNumber


pragma solidity >= 0.7.0 < 0.9.0;

contract SimpleStorage{

    uint256 myFavoriteNumber;

    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople;

//below is the mapping data type "mapping(string => uint256)" made public and instantiated with the variable "nameToFavoriteNumber"
//this mapping data simply says, map the name of a person (which is of course a string) to their favoriteNumber) and make it publicly accessed
//then the variable is the storage where we can go on to access this mapping instruction
//with this set, we don't have to keep lopping through the listOfPeople variable storing the list of persons with their favoriteNumber in Person[]
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256){
        return myFavoriteNumber;
    }

    function addPeople(uint256 _favoriteNumber, string memory name) public {
        listOfPeople.push(Person(_favoriteNumber, name));

//what this syntax below is saying is "in our nameToFavoriteNumber mapping", anytime you are looking for that person's name
//you automatically get thir favoriteNumber
        nameToFavoriteNumber[name] = _favoriteNumber;
    }
}

//But what if we want other contracts to deploy this contract into themselves and interact with this contract
//this is the very essence of blockchains - contracts interacting seamlessly with each other. This is called composability 
//Smart contracts are compasable because they easily interact with each other 
