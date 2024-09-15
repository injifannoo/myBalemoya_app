class Payment {
  final String id;
  final double amount;
  final String name;
  final String email;
  final String phoneNumber;
  final String status;

  Payment({
    required this.id,
    required this.amount,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.status,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      amount: json['amount'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      status: json['status'],
    );
  }
}
