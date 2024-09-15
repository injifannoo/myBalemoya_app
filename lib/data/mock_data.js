const fs = require('fs');
const path = require('path');

class MockData {
    static getDataFilePath() {
        return path.join(__dirname, 'data.json');
    }
    static getDataFilePath1() {
        return path.join(__dirname, 'data1.json');
    }

    static async readData() {
        const dataPath = this.getDataFilePath();
        console.log('Reading data from:', dataPath); // Log the path
        return new Promise((resolve, reject) => {
            fs.readFile(dataPath, 'utf8', (err, data) => {
                if (err) {
                    console.error('Error reading data.json:', err); // Log specific error
                    return reject(err);
                }
                try {
                    console.log('Data read successfully:', data); // Log the data
                    resolve(JSON.parse(data));
                } catch (parseErr) {
                    console.error('Error parsing data.json:', parseErr); // Log parsing error
                    reject(parseErr);
                }
            });
        });
    }

    static async writeData(data) {
        const dataPath = this.getDataFilePath();
        console.log('Writing data to:', dataPath); // Log the path
        return new Promise((resolve, reject) => {
            fs.writeFile(dataPath, JSON.stringify(data, null, 2), (err) => {
                if (err) {
                    console.error('Error writing to data.json:', err); // Log specific error
                    return reject(err);
                }
                console.log('Data written successfully'); // Log success
                resolve();
                resolve();
            });
        });
    }

    static async addUser({ name, email, phone, profession, password }) {
        try {
            const data = await this.readData();

            // Check if user already exists
            if (data.users.find(user => user.email === email)) {
                return { success: false, message: 'User already exists' };
            }

            // Add new user
            data.users.push({ name, email, phone, profession, password });

            // Save updated data
            await this.writeData(data);

            return { success: true, message: 'Sign-up successful' };
        } catch (err) {
            return { success: false, message: 'Failed to sign up user' };
        }
    }

    static async loginUser({ phone, password }) {
        try {
            const data = await this.readData();

            // Check if user exists and password matches
            const user = data.users.find(user => user.phone === phone && user.password === password);
            if (user) {
                return { success: true, message: 'Login successful' };
            }
            return { success: false, message: 'Invalid email or password' };
        } catch (err) {
            return { success: false, message: 'Failed to log in user' };
        }
    }
  
  
    static async readData1() {
        const dataPath1 = this.getDataFilePath1();
        console.log('Reading data from:', dataPath1); // Log the path
        return new Promise((resolve, reject) => {
            fs.readFile(dataPath1, 'utf8', (err, data) => {
                if (err) {
                    console.error('Error reading data1.json:', err); // Log specific error
                    return reject(err);
                }
                try {
                    console.log('Data read successfully:', data); // Log the data
                    resolve(JSON.parse(data));
                } catch (parseErr) {
                    console.error('Error parsing data1.json:', parseErr); // Log parsing error
                    reject(parseErr);
                }
            });
        });
    }
  
    static async writeData1(data) {
        const dataPath1 = this.getDataFilePath1();
        console.log('Writing data to:', dataPath1); // Log the path
        return new Promise((resolve, reject) => {
            fs.writeFile(dataPath1, JSON.stringify(data, null, 2), (err) => {
                if (err) {
                    console.error('Error writing to data1.json:', err); // Log specific error
                    return reject(err);
                }
                console.log('Data1 written successfully'); // Log success
                resolve();
                resolve();
            });
        });
    }
    
//     static async payPayment({ amount, email, phone, description }) {
//         try {
//             const data = await this.readData1();
  
//             // Check if user already exists
//             if (data.users.find(user => user.email === email)) {
//                 return { success: false, message: 'User already exists' };
//             }
  
//             // Add new user
//             data.users.push({ amount, email, phone, description });
  
//             // Save updated data
//             await this.writeData1(data);
  
//             return { success: true, message: 'Payment successful' };
//         } catch (err) {
//             return { success: false, message: 'Failed to pay' };
//         }
//     }
  
//   }

// module.exports = MockData;
static async payPayment({ amount, name,email, phone, description }) {
    try {
      const data = await this.readData1();
      
      // Check if user already exists
      let user = data.users.find(user => user.email === email);
      if (!user) {
        user = { name,email, phone, walletBalance: 0, transactions: [] };
        data.users.push(user);
      }

      // Update the user's wallet balance
      user.walletBalance += amount;
      user.transactions.push({ amount, description, timestamp: new Date() });

      // Save updated data
      await this.writeData1(user);

      return { success: true, message: 'Payment successful' };
    } catch (err) {
      console.error('Failed to process payment:', err);
      return { success: false, message: 'Failed to pay' };
    }
  }


//callback mockData
static async callback({ tx_ref, amount, name, email, phone }) {
    try {
      const data = await this.readData1();
      console.log('read in callback');
      
      // Check if user already exists
      let user = data.users.find(user => user.email === email);
      if (!user) {
        user = { name, email, phone, walletBalance: 0, transactions: [] };
        data.users.push(user);
      }
  
      // Update the user's wallet balance
      user.walletBalance += amount;
  
      // Add the transaction
      user.transactions.push({
        transactionId: tx_ref,
        amount,
        type: 'deposit',
        timestamp: new Date()
      });
  
      // Save updated data
      await this.writeData1(data);  // Save the entire data object, not just user
  
      return { success: true, message: 'Payment successful in mock_data.js', user };
    } catch (err) {
      console.error('Failed to process payment in mD:', err);
      return { success: false, message: 'Failed to pay mD' };
    }
  }
}  
module.exports = MockData;


// mock_data.js
// class MockData {
//     static users = [];

//     static async addUser({ name, email, phone, profession, password }) {
//         // Check if user already exists
//         for (let user of this.users) {
//             if (user.email === email) {
//                 return { success: false, message: 'User already exists' };
//             }
//         }

//         // Add user to mock data
//         this.users.push({ name, email, phone, profession, password });
//         return { success: true, message: 'Sign-up successful' };
//     }

//     static async loginUser({ email, password }) {
//         // Check if user exists and password matches
//         for (let user of this.users) {
//             if (user.email === email && user.password === password) {
//                 return { success: true, message: 'Login successful' };
//             }
//         }
//         return { success: false, message: 'Invalid email or password' };
//     }
// }

// module.exports = MockData;
