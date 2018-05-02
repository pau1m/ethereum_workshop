module.exports = {
  migrations_directory: "./migrations",
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*", // Match any network id
      gas: 4600000
    },
    rinkeby: {
      host: "localhost",
      port: 8545,
      network_id: "4", // Match any network id
      gas: 4600000
    }
  }
};

