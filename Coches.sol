pragma solidity ^0.5.0;

contract Coches{
    //Variables de Estado
    address owner;
    uint256 precio;
    
    //Array
    uint256[] identificadores;

    //Mapeo
    mapping (address => Coche) coches;

    struct Coche{
        uint256 identificador;
        string marca;
        uint32 caballos;
        uint32 kilometros;
    }

    modifier precioFiltro(uint256 _precio){
        require(_precio == precio);
        _;
    }
    
    constructor(uint256 _precio) public{
        owner = msg.sender;
        precio = _precio;
    }

    function addCoche(uint256 _id, string memory _marca, uint32 _caballos, uint32 _kilometros) public precioFiltro(msg.value) payable{
        identificadores.push(_id);
        coches[msg.sender].identificador = _id;
        coches[msg.sender].marca = _marca;
        coches[msg.sender].caballos = _caballos;
        coches[msg.sender].kilometros = _kilometros;
    }

    function getIdentificadores() external view returns(uint256){
        return identificadores.length;
    }

    //Recuperamos varios valores a la vez, en lugar de un sólo valor
    function getCoche() external view returns(string memory _marca, uint32 _caballos, uint32 _kilometros){
        _marca = coches[msg.sender].marca;
        _caballos = coches[msg.sender].caballos;
        _kilometros = coches[msg.sender].kilometros;
    }
}
