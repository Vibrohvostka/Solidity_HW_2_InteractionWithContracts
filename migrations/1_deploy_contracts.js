require('dotenv').config();

let HomeTask2 = artifacts.require("./HomeTask2.sol");

module.exports = async function(deployer){
    await deployer.deploy(HomeTask2);
}