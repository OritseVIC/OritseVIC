//SPDX-License-Identifier: MIT

//ARRAYS & STRUCTS
//In the previous function contract, we wrote a function to update and store the state with a favoriteNumber
//We then wrote another function to read (or view) the state, which we had initially set as public and gettable.

//But then here, we don't just want to store our own favoriteNumber, but other people's favoriteNumber
//Enter ARRAYS!

pragma solidity >= 0.7.0 < 0.9.0;

contract SimpleStorage {

//For this function, we deliberately want to make this state not public for now
    uint256 favoriteNumber;

//the bracket below signifies that we have a list or array of favoriteNumbers.

    uint256[] listOfFavoriteNumbers; //an array looks like this; [0, 78, 3...]; this is simply a list of values with "0" as index 0 or zero element, 
//"78" as index 1 or 1st element; "3" as index 2, and so on... 

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber; 
     }

    function retrieve() public view returns(uint256){      
        return favoriteNumber;
    }
}

//the uint256 array [] of favoriteNumbers is okay, but then it only tells us the list of numbers in the array. 
//We don't know the person or persons whose favoriteNumbers those are in the array or list.

//So, what do we do? ENTER STRUCTS and create a data type called Person who will now be assigned to their respective chosen favoriteNumber(s)

contract SimpleStorage2 {

    uint256 myFavoriteNumber; //we change the favoriteNumber here to myFavoriteNumber so that it doesn't clash with the favoriteNumber in the struct below

//the struct "Person" is a custom type that we set and inside it, we will define what the type Person is comprised of 

    struct Person{
        uint256 favoriteNumber; //this means each Person has a favoriteNumber
        string name; //this means each Person has a uniquely identifiable name
    }

//Now that we have a data type "Person" just like the data type uint256, which has its own variable myfavoriteNumber,we can now as well
//assign a variable to the data type "Person", make it publicly visible

    Person public person1 = Person({favoriteNumber: 7, name: "Victor"}); //Here we are initializing the state variable person1 to be equal to
//the local variable favoriteNumber "7" of the person1's name "Victor". Remember these are the data in the struct we wrote sabove 

    function store(uint256 _favoriteNumber) public {
       myFavoriteNumber = _favoriteNumber; 
     }

    function retrieve() public view returns(uint256){      
        return myFavoriteNumber;
    }
}

//But this is great finding the one Person1 who has a specific favoriteNumber; but what if we want to find out more than one Person who have their specific favoriteNumbers?
// Something like replicating the person variable in line 75


contract SimpleStorage3{

    uint256 myFavoriteNumber;

    struct Person{
        uint256 favoriteNumber;
        string name;
    }
  
//we could decide to write out the following, for more than one person in the list of Persons with each person's favorite number
 // Person public person1  = Person ({favoriteNumber: 7, name: "Victor"});
// Person public person2 = Person ({favoriteNumber: 8, name: "Mariah"})
//Person public person3 = Person ({favoriteNumber: 2, name: "Duru"})

//This is obviously a very tedious way to create lists of people especially when the list is highly dynamic. 
//The solution to this tedious work is:
//to use the array syntax "uint256[] listOfFavoriteNumbers;" , which we just learned in SimpleStorage contract 
//We use this type of sysntax to create an array of persons or lists

//The bracket below by Person signifies that we have a list of People with the data type Person, not whole numbers or string. 
//and the array is dynamic (meaning no fixed or static number of People in the list). We will therefore be leaving the bracket open because
//We're gonna have an arbitrary number of People with favoriteNumbers in this list


    Person[] public listOfPeople;

    function store(uint256 _favoriteNumber) public{
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256){
        return myFavoriteNumber;
    }

//next we're creating a function that will let us add People, or update the array
//the function named addPerson will take two variables [uint256 favoriteNumber and string memory name]

    function addPerson(uint256 _favoriteNumber, string memory name) public {
    //we write  push function to allow us add or push elements into our list of people array
        listOfPeople.push(Person(_favoriteNumber, name));//with the bracket written out, solidity is smart enough to first  
//execute the code inside the bracket by pushing (or updating the Person list with the favoriteNumber and name
//and then go on to execute the next code outside of the bracket by pushing into the listOfpeople variable whatever is inside the data type Person into 

    }
}

//This code is shaping up; we can store variables; we can add people; but there is a problem
//what if we hae a ton of people with their favoritenumbers in this list, and we have someone who needs to find their number, which they submitted to this system
//We have a problem of having t keep looping throgh the tons of names in the list to get to a person and their favoriteNumber

//There is a better data structure than a list or an array that makes it easier for us to access this information
//enter MAPPING: a set of keys, with each key returnign a special set of information about that key
