pragma solidity >=0.4.21 <0.6.0;

contract MyToken {
	string public name = "My Token";
	string public symbol = "MYT";
	string public standard = "My Token v1.0";
	uint256 public totalSupply;

	event Transfer(
		address indexed _from, 
		address indexed _to,
		uint256 _value);

	mapping (address => uint256) public balanceOf;
	
	constructor (uint256 _initialSupply) public {
		balanceOf[msg.sender] = _initialSupply;
		totalSupply = _initialSupply;
		//allocate the inital Supply
	}

	//transfer 
	function transfer (address _to, uint256 _value) public returns(bool success) {
		//exception of account doesn't have enuf
		require(balanceOf[msg.sender] >= _value); 
		//runs the code below only if require is true
		//transfer the balance
		balanceOf[msg.sender] -= _value;
		balanceOf[_to] += _value;
		//transfer event
		emit Transfer(msg.sender, _to, _value);
		//return boolean
		return true;

	}
	

}