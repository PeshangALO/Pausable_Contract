pragma solidity 0.5.2;

contract Bank{

    mapping (address => uint) balances;
    // a state variable
    bool private _paused; 

    address public owner;

    constructor() internal{
        _paused = false;
        owner = msg.sender;
        
    }

    modifier onlyOwner{
        require(msg.sender == owner);
    }
    // Allow to execute when contract is not paused.
    modifier whenNotPaused(){
        require(!_paused);
        _;

    }
     // Allow to execute when contract is paused.
     modifier whenPaused(){
         require(_paused);
         _;
        
    }

    function pause() public onlyOwner onlyOwner whenNotPaused{
        _paused = true;
    }

    function unPause() public onlyOwner whenPaused{
        _paused = false;
    }

    function withdrawAll() public{
        uint amountToWithdraw = balances[msg.sender];
        balances[msg.sender] = 0;
        require(msg.sender.call.value(amoutToWithdraw));
    }

    function emergencyWithdrawAll(address emergencyAddress) public onlyOwner whenPaused{
        // Whithdraw to owner
        // Or withdraw to some emergeny address or wallet.

    }

}