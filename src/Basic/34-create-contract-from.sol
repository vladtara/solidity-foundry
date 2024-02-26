// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
//Contracts can be created by other contracts using the new keyword. 
//Since 0.8.0, new keyword supports create2 feature by specifying salt options.

contract Car {
    address public owner;
    string public model;
    address public carID;

    constructor(address _owner, string memory _model) payable {
        owner = _owner;
        model = _model;
        carID = address(this);
    }
}


contract CarFactory {
    Car[] public cars;

    function create(address _owner, string calldata _model) public {
        Car car = new Car(_owner,_model);
        cars.push(car);
    }

    function createWithEther(address _owner, string calldata _model) public payable {
        Car car = (new Car){value: msg.value}(_owner,_model);
        cars.push(car);
    }

    function create2(address _owner, string calldata _model, bytes32 _salt) public {
        Car car = (new Car){salt: _salt}(_owner, _model);
        cars.push(car);
    }   

    function create2WithEther(address _owner, string calldata _model, bytes32 _salt) public payable {
        Car car = (new Car){value: msg.value, salt: _salt}(_owner,_model);
        cars.push(car);
    }

    function getCar(uint _index) public view returns(address,string memory, address, uint) {

        Car car = cars[_index];
        return (car.owner(), car.model(), car.carID(), address(car).balance);
    }
}
