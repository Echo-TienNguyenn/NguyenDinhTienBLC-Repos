const bip39 = require('bip39');
const hdkey = require('ethereumjs-wallet/hdkey');

//from given seed phrase we generate a seed > using seed we useH HMAC-SHA-512 hasing algorith under the method in
// the "ethereumjs-wallet/hdkey" library to make master private key  > we then use master private key to to derive child private key using BIP32 hiearchial deterministic path > we then use child private key to get ethereum address

const seedPhrase = 'need true summer solid easy attend cinnamon pole essence project oval onion';
// Generate seed from seed phrase using BIP39
const seed = bip39.mnemonicToSeedSync(seedPhrase);

// Generate master private key from seed using HMAC-SHA-512
const masterHDKey = hdkey.fromMasterSeed(seed);

// Derive child private key using BIP32 hierarchical deterministic path
const path = "m/44'/60'/0'/0/0";
const wallet = masterHDKey.derivePath(path).getWallet();

// Generate Ethereum address from child private key using function from ethereumjs-wallet library
const address = `0x${wallet.getAddress().toString('hex')}`;

console.log(`Child private key: 0x${wallet.getPrivateKey().toString('hex')}`);
console.log(`Ethereum address: ${address}`);


