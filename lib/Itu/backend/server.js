// const express = require('express');
// const bodyParser = require('body-parser');
// const { data, saveData } = require('./mockData'); // Import the mock data and save function

// const app = express();
// app.use(bodyParser.json());

// // Function to find a user by email
// function findUserByEmail(email) {
//   return data.users.find(user => user.email === email);
// }

// // Chapa Callback Endpoint using mock data
// app.post('/callback', (req, res) => {
//   const { tx_ref, status, amount, email, phone } = req.body;

//   if (status === 'success') {
//     let user = findUserByEmail(email);
//     if (!user) {
//       user = { email, phoneNumber: phone, walletBalance: 0, transactions: [] };
//       data.users.push(user);
//     }

//     // Update the user's wallet balance
//     user.walletBalance += amount;

//     // Save the transaction
//     user.transactions.push({ transactionId: tx_ref, amount, type: 'deposit', timestamp: new Date() });

//     // Save the updated data
//     saveData();

//     // Return success response
//     res.status(200).json({ status: 'success', message: 'Payment successful', user });
//   } else {
//     res.status(400).json({ status: 'failed', message: 'Payment failed' });
//   }
// });

// // Endpoint to deduct commission using mock data
// app.post('/deduct-commission', (req, res) => {
//   const { email } = req.body;

//   let user = findUserByEmail(email);
//   if (!user) {
//     return res.status(400).json({ status: 'failed', message: 'User not found' });
//   }

//   if (user.walletBalance >= 50) {
//     user.walletBalance -= 50;
//     user.transactions.push({ transactionId: `commission_${Date.now()}`, amount: -50, type: 'commission', timestamp: new Date() });

//     // Add commission to the platform owner (mock owner)
//     let owner = findUserByEmail('owner@gmail.com');
//     if (!owner) {
//       owner = { email: 'owner@gmail.com', walletBalance: 0, transactions: [] };
//       data.users.push(owner);
//     }
//     owner.walletBalance += 50;

//     // Save the updated data
//     saveData();

//     res.status(200).json({ status: 'success', message: 'Commission deducted', user });
//   } else {
//     res.status(400).json({ status: 'failed', message: 'Insufficient balance' });
//   }
// });

// app.get('/wallet/:email', (req, res) => {
//   const email = req.params.email;
//   console.log(`Received request for wallet with email: ${email}`);

//   const user = findUserByEmail(email);

//   if (user) {
//     res.status(200).json(user);
//   } else {
//     res.status(404).json({ status: 'failed', message: 'User not found' });
//   }
// });


// app.get('/', (req, res) => {
//   res.send('Server is running');
// });
// app.post('/api/getUserWallet', (req, res) => {
//   const { email } = req.body;
//   if (mockData.userWallets[email]) {
//     res.json(mockData.userWallets[email]);
//   } else {
//     res.status(404).json({ message: 'User not found' });
//   }
// });

// app.post('/api/createPayment', (req, res) => {
//   const { amount, email } = req.body;
//   // Use mockData for payment response
//   res.json(mockData.paymentResponse);
// });
// const PORT = process.env.PORT || 3000;
// app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
