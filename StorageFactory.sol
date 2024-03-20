//SPDX-License-Identifier: MIT

//But what if we want this SimpleStorage contract to deploy the mapping contract we created in the file "Mappings.sol", 
//and interact with the Mappings.sol contract. This is the very essence of blockchains - contracts interacting seamlessly with each other. 
//This is called composability. Smart contracts are composable because they easily interact with each other 

pragma solidity >= 0.7.0 < 0.9.0;

//To make this new contract StorageFactory to know that outside of itself, another contract file called "SimpleStorage3.sol" exists for deployment 
//and further interaction with it, instead of copying that outside file into this one above the contract "StorageFactory", we can do this instead 

//this import "/.SimpleStorage3.sol" function is therefore the shorthand way to bring in all the data in the SimpleStorage3.sol file for us
//to interact with here in this new StorageFactory contract written out in line  17

import {SimpleStorage_Mapping} from "./SimpleStorage_Mapping.sol"; //note that if we were working with a contract file that had multiple contracts, 
//you should never work by just importing the major contract, but this way by picking the actual contract within a file
//for example, if we were to import from "SimpleStorage_Arrays-Structs", which has about three contracts within that file
//here is the standard way to work this out by specifying the exact contract we want to import from this file:

// import {SimpleStorage_Struct2} from "./SimpleStorage_Arrays-Structs.sol"; //This means we want to work with 
//the contract SimpleStorage_Struct2 from the main SimpleStorage_Arrays-Structs.sol file.

//We can also specifically import multiple contracts from a contract. With the same example, we can do as such:
// import {SimpleStorage_Struct, SimpleStorage_2} from "./SimpleStorage_Arrays-Structs.sol"; //This means that within the curly brackets, those 
//two contracts are what we specifically want to work with from the main file: SimpleStorage_Arrays-Structs.sol

//By learning to specify contracts within a contract file to work with, you are better than 80% of the solidity developers out there

contract StorageFactory{

//To call on our imported SimpleStorage_Mappings" function, we can regard it as a data type because that's what every contract is by default: a type of data that can be interacted with
//To call on it, we adopt the same "uint256 public favoriteNumber;" state variable pattern. This as usual helps us with a getter for the 
//createSimpleStorageContract to call upon 

//1. SimpleStorage[] becomes the data type, like uint256. Only this time, we specify that it is an array of data (of Persons and their indivdual favoriteNumber) 
//we dealt with in that imported SimpleStorage_Mapping contract

//2. we create a public visibility or getter
//3. listOfSimpleStorageMappingContracts becomes the state variable holding all the array or list of data in SimpleStorage_Mapping contract. 
//That is, SimpleStorage_Mapping is instantiated with the state "listOfSimpleStorageMappingContracts" 

    SimpleStorage_Mapping[] public listOfSimpleStorageMappingContracts;

//this function below will deploy a contract (our Mappings contract for example) and save it to a state variable
    function createSimpleStorageContract() public{

        //This line below creates a local variable named newSimpleStorageMappingContract, which instantiates (creates a new instance of) 
    //the imported contract, called SimpleStorage_Mapping. This means it deploys a new copy of the SimpleStorage_Mapping contract on the blockchain.

//In other words, inside the function, a new instance [new SimpleStorage_Mapping()] of the SimpleStorage_Mapping contract is created,
// and assigned to the variable newSimpleStorageMappingContract.
        SimpleStorage_Mapping newSimpleStorageMappingContract = new SimpleStorage_Mapping();

//Next, the variable newSimpleStorageMappingContract, which is initialized with the "new SimpleStorage_Mapping" contract 
//is then added or "pushed" to the end of the listOfSimpleStorageMappingContracts array.

        listOfSimpleStorageMappingContracts.push(newSimpleStorageMappingContract);
    }
//Now we need to make this contract StorageFactory interact with the function inside the contract we have imported.
//Function to Store Data in SimpleStorage_Mapping Contracts:
    function sfstore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageMappingNumber) public {
        //Address = _newSimpleStorageMappingNumber
        //ABI = _simpleStorageIndex
      
//This line below calls the "store" function on whatever is in the newSimpleStorageMapping contract at the specified index from 
//the listOfSimpleStorageMappingContracts array 

      listOfSimpleStorageMappingContracts[_simpleStorageIndex].store(_newSimpleStorageMappingNumber);
    }

//Function to Retrieve Data from SimpleStorage_Mapping Contracts
//This line declares a public view function named sfGet. It takes one parameter: _simpleStorageIndex. 
//Being a view function, it does not modify the state of the contract and can be called without gas costs. It returns a uint256.
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){


 //Since the SimpleStorage_Mapping contract at the specified index from the listOfSimpleStorageMappingContracts array has been assigned 
//to the local variable mySimpleStorage_Mapping, which is in turn initialized to the array "listOfSimpleStorageMappingContracts' 
//at its specified index "[_simpleStorageIndex]", we can simply call the "retrieve" function on the array listOfSimpleStorageMappingContracts at that specified index   
      
        return listOfSimpleStorageMappingContracts[_simpleStorageIndex].retrieve(); //This line calls the retrieve function on the mySimpleStorage_Mapping contract and returns the result. 
//This function is expected to return the stored number from the SimpleStorage_Mapping contract.
    }
   
}

//But what if in the "SimpleStorage_Mapping" contract, in the "function store(uint256 _favoriteNumber) public {}"
 // we  want the _favoriteNumber" that initializes myFavoriteNumber in  "myFavoriteNumber = _favoriteNumber;" to be +5 
//for every favorite number the user chooses.  
     
