const express = require('express');
const fs = require('fs');
const path = require('path');
const cors = require('cors');
const bodyParser = require('body-parser');
const mockData = require('./mock_data.js');
// Import the mock data and save function

const app = express();
app.use(cors());
app.use(express.json());
app.use(bodyParser.json());

function loadUsersFromData1() {
  const data =mockData.readData1();
  // fs.readFileSync(path.join(__dirname, 'data1.json'), 'utf8');
  return JSON.parse(data).users;
}

// Function to find a user by email from data1.json
function findUserByEmail(email) {
  const users = loadUsersFromData1();
  return users.find(user => user.email === email);
}

// Endpoint to get data from data.json
app.get('/data', (req, res) => {
    fs.readFile(path.join(__dirname, 'data.json'), 'utf8', (err, data) => {
        if (err) {
            return res.status(500).json({ error: 'Failed to read data file' });
        }
        res.json(JSON.parse(data));
    });
});
app.get('/data1', (req, res) => {
  fs.readFile(path.join(__dirname, 'data1.json'), 'utf8', (err, data1) => {
      if (err) {
          return res.status(500).json({ error: 'Failed to read data file' });
      }
      res.json(JSON.parse(data1));
  });
});

// Endpoint to use mock data for adding users and login
app.post('/signup', (req, res) => {
    const { name, email, phone, profession, password } = req.body;
    mockData.addUser({ name, email, phone, profession, password })
        .then(result => res.json(result))
        .catch(error => res.status(500).json({ success: false, message: error.message }));
});

app.post('/login', (req, res) => {
    const { phone, password } = req.body;
    mockData.loginUser({ phone, password })
        .then(result => res.json(result))
        .catch(error => res.status(500).json({ success: false, message: error.message }));
});

//THE FOLLOWING ARE PART OF PAYMENT METHOD

// Chapa Callback Endpoint using mock data
// Callback endpoint to handle Chapa's notifications

app.post('/callback', async (req, res) => {
  console.log('Callback received:', req.body); 
  console.log('what is wrong with callback')// Log the request body
  const { tx_ref, status, amount, name, email, phone } = req.body;

  if (status === 'success') {
    try {
      const result = await mockData.callback({ tx_ref, amount, name, email, phone });
      
      if (result.success) {
        res.status(200).json({ status: 'success', message: 'Payment successful in server', user: result.user });
      } else {
        res.status(500).json({ status: 'failed in server', message: result.message });
      }

    } catch (error) {
      console.error('Error handling callback:', error);
      res.status(500).json({ status: 'failed', message: 'Internal Server Error' });
    }
  } else {
    console.log('Payment failed:', req.body); // Log if the payment fails
    res.status(400).json({ status: 'failed', message: 'Payment failed' });
  }
});

//   if (status === 'success') {
//     try {
//       // Load the current data from data1.json
//       const data = await mockData.readData1();

//       // Find or create the user
//       let user = data.users.find(user => user.email === email);
//       if (!user) {
//         user = { name, email, phone, walletBalance: 0, transactions: [] };
//         data.users.push(user);
//       }

//       // Update the user's wallet balance
//       user.walletBalance += amount;

//       // Add the transaction
//       user.transactions.push({
//         transactionId: tx_ref,
//         amount,
//         type: 'deposit',
//         timestamp: new Date()
//       });

//       // Save the updated data to data1.json
//       await mockData.writeData1(data);

//       // Return success response
//       res.status(200).json({ status: 'success', message: 'Payment successful', user });
//     } catch (error) {
//       console.error('Error handling callback:', error);
//       res.status(500).json({ status: 'failed', message: 'Internal Server Error' });
//     }
//   } else {
//     console.log('Payment failed:', req.body); // Log if the payment fails
//     res.status(400).json({ status: 'failed', message: 'Payment failed' });
//   }
// });



// Endpoint to create payment using mock data
app.post('/api/createPayment', (req, res) => {
  const { amount,name, email,phone, description } = req.body;
  // Use mockData for payment response
  mockData.payPayment({ amount,name, email, phone, description })
  .then(result => res.json(result))
  .catch(error => res.status(500).json({ success: false, message: error.message }));
});

// app.post('/callback', (req, res) => {
//   const { tx_ref, status, amount, email, phone } = req.body;

//   if (status === 'success') {
//     let user = findUserByEmail(email);
//     if (!user) {
//       user = { email, phone: phone, walletBalance: 0, transactions: [] };
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
app.post('/verify-payment', async (req, res) => {
  const { tx_ref } = req.body;

  if (!tx_ref) {
    return res.status(400).json({ status: 'failed', message: 'Transaction reference is required' });
  }

  try {
    const response = await fetch(`https://api.chapa.co/v1/transaction/verify/${tx_ref}`, {
      method: 'GET',
      headers: {
        'Authorization': `Bearer ${process.env.CHAPA_API_KEY}` // Ensure you use your Chapa API key
      }
    });

    const result = await response.json();

    if (response.status === 200 && result.status === 'success') {
      // Verification succeeded
      console.log('Verification result:', result);

      // Optionally, update user's wallet balance and transaction history here
      let user = findUserByEmail(result.data.customer.email);
      if (!user) {
        return res.status(404).json({ status: 'failed', message: 'User not found' });
      }

      user.walletBalance += parseFloat(result.data.amount);
      user.transactions.push({
        transactionId: tx_ref,
        amount: parseFloat(result.data.amount),
        type: 'deposit',
        timestamp: new Date()
      });

      saveData(); // Save updated data

      return res.status(200).json({
        status: 'success',
        message: 'Payment verified successfully',
        user
      });
    } else {
      return res.status(400).json({
        status: 'failed',
        message: 'Payment verification failed',
        details: result
      });
    }
  } catch (error) {
    console.error('Error verifying payment:', error);
    return res.status(500).json({ status: 'failed', message: 'Internal Server Error' });
  }
});


// Endpoint to deduct commission using mock data
app.post('/deduct-commission', (req, res) => {
  const { email } = req.body;

  let user = findUserByEmail(email);
  if (!user) {
    return res.status(400).json({ status: 'failed', message: 'User not found' });
  }

  if (user.walletBalance >= 50) {
    user.walletBalance -= 50;
    user.transactions.push({ transactionId: `commission_${Date.now()}`, amount: -50, type: 'commission', timestamp: new Date() });

    // Add commission to the platform owner (mock owner)
    let owner = findUserByEmail('owner@gmail.com');
    if (!owner) {
      owner = { email: 'owner@gmail.com', walletBalance: 0, transactions: [] };
      data.users.push(owner);
    }
    owner.walletBalance += 50;

    // Save the updated data
    saveData();

    res.status(200).json({ status: 'success', message: 'Commission deducted', user });
  } else {
    res.status(400).json({ status: 'failed', message: 'Insufficient balance' });
  }
});

// Endpoint to get user wallet by email
app.get('/wallet/:email', (req, res) => {
  const email = req.params.email;
  console.log(`Received request for wallet with email: ${email}`);

  const user = findUserByEmail(email);

  if (user) {
    res.status(200).json(user);
  } else {
    res.status(404).json({ status: 'failed', message: 'User not found' });
  }
});

// Simple root endpoint
app.get('/', (req, res) => {
  res.send('Server is running');
});

// Endpoint to get user wallet using mock data
app.post('/api/getUserWallet', (req, res) => {
  const { email } = req.body;
  if (mockData.userWallets[email]) {
    res.json(mockData.userWallets[email]);
  } else {
    res.status(404).json({ message: 'User not found' });
  }
});


// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));




// const express = require('express');
// const fs = require('fs');
// const path = require('path');
// const app = express();
// const port = 3000;
// const cors = require('cors');
// app.use(cors());

// // Middleware to parse JSON bodies
// app.use(express.json());

// // Load mock data
// const mockData = require('./mock_data.js');

// // Endpoint to get data from data.json
// app.get('/data', (req, res) => {
//     fs.readFile(path.join(__dirname, 'data.json'), 'utf8', (err, data) => {
//         if (err) {
//             return res.status(500).json({ error: 'Failed to read data file' });
//         }
//         res.json(JSON.parse(data));
//     });
// });

// // Endpoint to use mock data for adding users and login
// app.post('/signup', (req, res) => {
//     const { name, email, phone, profession, password } = req.body;
//     mockData.addUser({ name, email, phone, profession, password })
//         .then(result => res.json(result))
//         .catch(error => res.status(500).json({ success: false, message: error.message }));
// });

// app.post('/login', (req, res) => {
//     const { phone, password } = req.body;
//     mockData.loginUser({ phone, password })
//         .then(result => res.json(result))
//         .catch(error => res.status(500).json({ success: false, message: error.message }));
// });

// // Start the server
// const PORT = process.env.PORT || 3000;
// app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
// // app.listen(port, () => {
// //     console.log(`Server running at 'http://192.168.25.151:${port}`);
// //});
