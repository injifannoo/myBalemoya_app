class WalletService {
  double _balance = 0.0;

  double get balance => _balance;

  void deposit(double amount) {
    _balance += amount;
  }

  void deduct(double amount) {
    _balance -= amount;
  }

  void deductCommission() {
    if (_balance > 500) {
      deduct(50.0); // Deduct 50 ETB commission
    }
  }

  bool hasSufficientBalance(double minimum) {
    return _balance >= minimum;
  }
}
