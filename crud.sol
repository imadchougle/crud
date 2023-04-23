pragma solidity >0.4.0 <0.6.0;

contract crud{
    
    struct User{
        uint id;
        string name;
        string email;
        uint age;
    }
    
    User[] user;
    uint nexid;
    
    function create(string memory name,string memory email,uint age) public{
        user.push(User(nexid,name,email,age));
        nexid++;
    }
    
    function read(uint ids) public view returns(uint,string memory,string memory,uint){
        uint i = find(ids);
        return (user[i].id , user[i].name , user[i].email , user[i].age);
    }
    
    function update(uint ids,string memory name,string memory email,uint age) public{
        uint i = find(ids);
        user[i].name = name;
        user[i].email = email;
        user[i].age = age;
    }
    
    function destroy(uint ids) public{
        uint i = find(ids);
        delete user[i];
    }
    
    function find(uint ids) internal view returns(uint){
        for (uint i=0 ; i < user.length ; i++){
            if (user[i].id == ids){
                return i;
            }
        }
        revert('User is not Existing');
    }
}
