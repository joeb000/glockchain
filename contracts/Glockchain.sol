contract Glockchain {

    event LogGunShot(address indexed gunID, address indexed shooter, uint latitude, uint longitude, uint timestamp);
    event LogGunDrawn(address indexed gunID, address indexed shooter, uint latitude, uint longitude, uint timestamp);
    event LogGunHolstered(address indexed gunID, address shooter, uint timestamp);

    address public policeDepartmentID = msg.sender;
    uint public constant subscriptionFee = 5000000000000000000; //minimum fee required for subscription
    uint256 public  constant subscriptionLength = 5000; //length in blocks to subscribe to data

    mapping(address => Gun) public registeredGuns;
    mapping(address => bool) public subscribers;
    mapping(address => uint) donations;

    struct Gun {
        bool isRegistered;
        bool isDrawn;  //if not isDrawn then assume holstered/safe
        bool isLocked;
        address owner;
    }

    modifier onlyGuns {
        if (!registeredGuns[msg.sender].isRegistered)
            throw;
        _
    }

    modifier onlyPolice {
        if (policeDepartmentID!=msg.sender)
            throw;
        _
    }

    modifier onlySubscriber {
        if (!subscribers[msg.sender])
            throw;
        _
    }

    function Glockchain() {
        subscribers[msg.sender]=true;
    }

    function recordGunShot(address _shooter, uint _lat, uint _long) onlyGuns {
        LogGunShot(msg.sender, _shooter, _lat, _long, now);
    }

    function recordGunDrawn(address _drawer, uint _lat, uint _long) onlyGuns {
        LogGunDrawn(msg.sender,registeredGuns[msg.sender].owner, _lat, _long, now);
        registeredGuns[msg.sender].isDrawn = true;
    }

    function recordGunHosltered() onlyGuns {
        LogGunHolstered(msg.sender, registeredGuns[msg.sender].owner, now);
        registeredGuns[msg.sender].isDrawn = false;
    }

    //Register a new gun or update existing gun's registration
    function registerGun(address _gunID, address _ownerID) onlyPolice {
        registeredGuns[_gunID].isRegistered = true;
        registeredGuns[_gunID].owner = _ownerID;
        subscribers[_ownerID] = true;
    }

    function subscribeToData() {
        if (msg.value < subscriptionFee)
        throw;
        subscribers[msg.sender] = true;
    }

    function donateToDepartment(){
        donations[msg.sender] += msg.value;
    }

    function collectPayment(address _withdrawAddress) onlyPolice {
          if (_withdrawAddress.send(this.balance)) {
        }
    }
}
