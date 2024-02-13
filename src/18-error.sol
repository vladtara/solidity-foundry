// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// require is used to validate inputs and conditions before execution.
// revert is similar to require. See the code below for details.
// assert is used to check for code that should never be false. Failing assertion probably means that there is a bug.

contract Error {
    function testRequire(uint256 number) public pure {
        // Require should be used to validate conditions such as:
        // - inputs
        // - conditions before execution
        // - return values from calls to other functions
        require(number <= 10, "Input must be less than 10");
        number;
    }

    function testRevert(uint256 number) public pure {
        // Revert is useful when the condition to check is complex.
        // This code does the exact same thing as the example above
        if (number <= 10) {
            revert("Input must be less than 10");
        }
    }

    uint256 public num;

    function testAsesert() public view {
        // Assert should only be used to test for internal errors,
        // and to check invariants.

        // Here we assert that num is always equal to 0
        // since it is impossible to update the value of num
        assert(num == 1);
    }

    // Custom error
    error BadBalance(uint256 bal, uint256 amount);

    function testCustomError(uint256 _amount) public view {
        uint256 _bal = address(this).balance;
        if (_bal < _amount) {
            //revert BadBalance({bal: _bal, amount: _amount});
            revert BadBalance(_bal, _amount);
        }
    }
}

contract Account {
    uint256 public balance;
    uint256 public constant MAX_UINT = 2 ** 256 - 1;

    function deposit(uint256 _amount) public {
        uint256 oldBalance = balance;
        uint256 newBalance = balance + _amount;
        // balance + _amount does not overflow if balance + _amount >= balance
        require(newBalance >= oldBalance);

        balance = newBalance;

        assert(balance >= oldBalance);
    }

    function withdraw(uint256 _amount) public {
        uint256 oldBalance = balance;
        require(balance >= _amount, "Underflow");

        if (balance >= _amount) {
            revert("Underflow");
        }

        balance -= _amount;

        assert(balance <= oldBalance);
    }
}
