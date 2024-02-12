//SPDX-License-Identifier: MIT

pragma solidity >= 0.7.0 < 0.9.0;

contract SimpleStorage{

//major data types include: boolean; int; address; uint

//boolean defines a type as true or false
//uint is unsigned integer, which means it's a whole number that isn't positive or negative. It's just positive
//int is a number that's either a positive or negative whole number
//address is a sender or receiver's wallet address

//the reason we have these types is because we use them to define what different variables are. 
//You can think of variables as basically holders for different values 


    //bool favoriteNumber = true;
//this statement is saying the variable "favoriteNumber" has the type boolean, which though is either true or false, but
//for this statement, the variable is defined (set to) as "true". We could also set it as false, depending on what 
//you're trying to achieve

    //uint favoriteNumber = 5;

//uints are special because we can actually specify how many bits (another word for storage or memory) we want to allocate
//to the number to which we have set the variable. 

//Note: As we did not specify how much memory to allocate to the uint, solidity automtically defaults to uint256

//But then, it is advisable to write it out, whether it's uint8, uint16, uint32.....up to uint256


    //string favoriteNumberInText = "Five";
//strings represent basically words. The words are represented in quotes

    //int256 favouriteInt = -5; //or positive 5; our int can be positive or negative

    //address MyAddress = 0xEB1499075e0D95e64A62a155f6FE00Afb11C8765;

    //bytes32 favoritesBytes = "cat";
//bytes represent how many bytes or storage memory of data we want the variable to be
//strings are interesting because they are actually byte objects, but only for texts.
//bytes 32 is the maximum a bytes can go. While ints can go up to 256

//For now, let's work with ints

    //uint256 favoriteNumber;
//with this having no variable, solidity defaults to initializing it to zero. 
//i.e it sees uint256 favoriteNumber as equal to (=) 0

//Now let's create BASIC SOLIDITY FUNCTIONS

//"Functions", otherwise called "methods" are self-contained modules that will execute
//some specific sets of instructions (or codes) when we call it

//So now let's create a function called "store" that will change the value (the default zero) of favoriteNumber to a new value

    uint256 favoriteNumber;

    function store (uint256 _favoriteNumber) public{ //So in this function called "store", we pass the argument "_favoriteNumber" 
//as an int data type to represent whatever input that the user chooses to change the default zero value of the variable uint256 favoriteNumber

        favoriteNumber = _favoriteNumber;
    }


//You notice that when you deploy the contract and call the function "store" with any value the user wants to input
//It shows successful, but the value is not visible to you the viewer. So to do that, we make the variable "public"

    uint256 public bestNumber;

    function store2(uint256 _bestNumber) public{
        bestNumber = _bestNumber;
    } //when we deploy this contract, we see two  functions, "store" and store2"; but we also see the option 
//to view what bestNumber is when the user inputs a value to change the default zero value of the state variable bestNumber 
//likewise, from every value that the user continues changing, we are able to view it unlike the first function "store"


//Functions can have one of four visibility specifiers:

//1. "public": visible internally and externally (creates a getter function for storage/state variables). This means the "public" 
//visiblity returns the data for everyone to see who interacts with the contract. 

//2. "private" means only visible in the current contract

//3. "external" means only visible "externally" - somebody outside of the contract can call the function

//4. internal" means only visible "internally" - only this contract and its children contract can the function

//view, and pure functions, when called alone don't spend gas. 
//view and pure functions disallow modification of state. This means in the function below, we cannot update our favoriteNumber within the function "retrieve".
//The view function cannot modify the function but only "read" the state blockchain as seen below, where "view" is reading the state, "uint256 favoriteNumber;"
//
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

//  pure functions on its own disallows you from reading from the blockchain state. So it couldn't read the state variable uint256 = favoriteNumber  
//the best you can do with pure is some maths you want to use over and over again; 
//or any specific algorithm you want to implement that doesn't need to read any storage.
//Notice that the terms "storage" and "state" are used interchangeably; this is because a state is simply a simple storage

    function add() public pure returns(uint256){
        return (1 + 1);
    }

//so since we only spend gas when we make a transaction, like modifying a blockchain's state, pure function, which does not allow modification of a state,
//is effective for saving gas 
}
