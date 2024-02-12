//SPDX-License-Identifier: MIT

pragma solidity >= 0.7.0 < 0.9.0;

//what if we want to store more favorite numbers, more like a list of favorite numbers a particular person has? 
//Then that's an array of our favoriteNumber(s), not just onefavoriteNumber

contract SimpleStorage_Structs{

    uint256 favoriteNumber;
    
//The People struct as a data type has two properties: favoriteNumber and name
    struct People{
        uint256 favoriteNumber;
        string name;
    }

//People is a user-defined data structure (struct) already defined at line 11. Below, "People" now assumes the data type 
//that we assign to the "person" in this struct. This person is therefore declared a state variable of data type People, which is a struct 
//of properties [favoriteNumber (an unsigned integer) and name (a string)] defined in the struct  

//This variable is publicly accessible, meaning other contracts or users can read its value
//and the "person" state variable is then assigned initial values: favoriteNumber is set to 2, 
//and name is set to "Victor".
      People public person = People(2, 'Victor');

//We can still assign initial values in another way. Either this or the commened code below wll still gie us the reqired result
//    People public person = People({favoriteNumber: 2, name: "Victor"});

}


//BUT then the struct above actually accounts for just the list of details belonging to one person's data. 
//What if we have to account for the same list of favoriteNumber(s) details of multiple users 
//who are interacting with the blockchain, then it will not be effective to be writing:

//People public person2 = People({favoriteNumber: 4, name: "Shege"});
//People public person3 = People({favoriteNumber: 7, name: "Arinze"});
//People public person4 = People({favoriteNumber: 9, name: "Ola"});
//and so on..... phewwww! This will be too burdensome and ineffective.

//So here's how we approach it, by creating an array
//An ARRAY is a data structure that holds a list of other types


contract ArrayStructs{

    uint256 favoriteNumber;

//this is saying we want an array (denoted by the '[]') of People, and we declare a state variable of 'persons'
//in the list to whom we will be passing or assigning values

   People2[] public persons; //"People2[] public persons;" declares an array named persons of type People2[] - the struct below. 
//This array is declared as public, which means it can be accessed from outside the contract.

//The struct People2 defines a custom data structure with two properties: favoriteNumber of type uint256 
//and name of type string.
    struct People2{
        uint256 favoriteNumber;
        string name;
    }

//The addPerson function allows adding a new person to the persons array. It takes two arguments:
// _favoriteNumber and _name, representing the favorite number and name of the person, respectively.
    function addPerson(uint256 _favoriteNumber, string memory _name) public{
        persons.push(People2(_favoriteNumber, _name));
//Inside the function, "persons.push(People2(_favoriteNumber, _name));" creates a new instance of the People2 struct 
//using the provided _favoriteNumber and _name, and then pushes it into the persons array.
    }
    
}





    






