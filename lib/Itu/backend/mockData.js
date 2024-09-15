// mockData.js
// const fs = require('fs');
// const path = require('path');

// Path to the JSON file where the mock data will be stored

 
// Initialize data
// let data = {
//   users: [
//     {
//       email: 'user1@gmail.com',
//       phoneNumber: '0912345678',
//       walletBalance: 1000.0,
//       transactions: [
//         {
//           transactionId: 'txn_123',
//           amount: 200.0,
//           type: 'deposit',
//           timestamp: new Date(),
//         },
//       ],
//     },
//     {
//       email: 'owner@gmail.com',
//       phoneNumber: '0987654321',
//       walletBalance: 5000.0,
//       transactions: [],
//     },
//   ],
// };

// // Function to save data to file
// function saveData() {
//   fs.writeFileSync(dataFilePath1, JSON.stringify(data, null, 2));
// }

// // Function to load data from file
// function loadData() {
//   if (fs.existsSync(dataFilePath1)) {
//     const fileData = fs.readFileSync(dataFilePath1);
//     data = JSON.parse(fileData);
//   } else {
//     saveData(); // Save initial data if file doesn't exist
//   }
// }

// // Load data at the start
// loadData();

// module.exports = {
//   data,
//   saveData,
// };
