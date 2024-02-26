// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todos;

    function create(string calldata _text) public {
        // 3 ways to initialize a struct

        // 1 calling it like a function
        todos.push(Todo(_text, false));

        // 2 key  valule map
        todos.push(Todo({text: _text, completed: false}));

        // 3 init empty struct and update it
        Todo memory todo;
        todo.text = _text;
        todos.push(todo);
    }

    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function.
    function get(uint256 _index) public view returns (string memory text, bool cpmpleted) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function updateText(uint256 _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function updateCompleted(uint256 _index, bool _completed) public {
        Todo storage todo = todos[_index];
        todo.completed = _completed;
    }
}

// Declaring and importing Struct
// File that the struct is declared in
// pragma solidity ^0.8.20;
// // This is saved 'StructDeclaration.sol'

// struct Todo {
//     string text;
//     bool completed;
// }

// File that imports the struct above
// pragma solidity ^0.8.20;

// import "./StructDeclaration.sol";

// contract Todos {
//     // An array of 'Todo' structs
//     Todo[] public todos;
// }
