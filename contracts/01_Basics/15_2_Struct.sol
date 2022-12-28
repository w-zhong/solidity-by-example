// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.7;

contract Struct {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    // First way to initialize a struct, calling it like a function.
    function create1(string calldata _text, bool _completed) public {
        todos.push(Todo(_text, _completed));
    }

    // Second way, key value mapping.
    function create2(string calldata _text, bool _completed) public {
        todos.push(Todo({text: _text, completed: _completed}));
    }

    // Third way, initialize an empty struct, then update it.
    function create3(string calldata _text, bool _completed) public {
        Todo memory todo;
        todo.text = _text;
        todo.completed = _completed;
        todos.push(todo);
    }

    function get(
        uint _index
    ) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function updateCompleted(uint _index, bool _completed) public {
        Todo storage todo = todos[_index];
        todo.completed = _completed;
    }
}

import "./15_1_ StructDeclaration.sol";

contract ImportStruct {
    ImportTodo[] public todos;
}
