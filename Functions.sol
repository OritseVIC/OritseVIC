//SPDX-License-Identifier: MIT

//FUNCTIONS
//Functions, or methods, are a subsection of code, that when called, will execute a very small piece of our entire code piece

pragma solidity >= 0.7.0 < 0.9.0;

contract SimpleStorage{

    uint256 public favoriteNumber; //by default, this is initialized to zero [0] since no value is given to our favoriteNumber
//the public identifier is a visibility for this function, making this function accessible both externally and internally (other people can call this function)

//the function store() will be responsible for updating our favoriteNumber; whatever is in between these two parentheses in function store () 
//represents what we're going to pass or send to our function, or, the parameters that we're going to send to our function. So, in this case below,
//the value we are passing into the our function is a uint256 _favoriteNumber (this underscore favoriteNumber stands for the variable number that the user
//will input. Since it is going to be variable favoriteNumbers, it is important we distinguish this favoriteNumber with an underscore
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber; //this means whenever we call this [function store()], it's going to set into the state variable favoriteNumber
        //whatever value we input in the variable [_favoriteNumber]
    }

//Notice when the contract is deployed, the terminal displays it as successful, but we cannot see in the deployed contracts whatever favoriteNumber that a user stores


//The function below doesn't send or pass any data. It simply is helping us read or retrieve or get whatever is  _favoriteNumber passed onto the state variable favoriteNumber in function store(). 
//We can get this data because the state variable has been made public, or gettable for everyone on chain
//the view & pure function don't actually have to run or send a transaction for you to call them. The function "view" here simply means we are just going to read state (what our favoriteNumber is) from the blockchain
//this is unlike our function store(), which is not reading anything; it's actually updating or making changes to the blockchain. So, we have to send a transaction.
//So in essence, the view function doesn't allow any modification to a blockchain state. It only reads or gets or retrieves what has been updated onto or modified in a state on the blockchain in a previous function in which we inputted the data
    function retrieve() public view returns(uint256){      
        return favoriteNumber;
    }
}

//The contract above is okay. We write a function to update and store the state with a favoriteNumber
//We then write a function to read (or view) the state, which we had initially set as public and gettable.

//But then what if we want to store not just our favoriteNumber, but other people's favoriteNumber
//Enter ARRAYS!


