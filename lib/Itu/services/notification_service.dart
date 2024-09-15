// lib/services/notification_service.dart

class NotificationService {
  // List to store notifications
  final List<Notification> _notifications = [];

  // Method to get all notifications
  List<Notification> get notifications => List.unmodifiable(_notifications);

  // Method to add a new notification
  void addNotification(String title, String message) {
    final notification = Notification(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      message: message,
      date: DateTime.now(),
      read: false,
    );
    _notifications.add(notification);
  }

  // Method to mark a notification as read
  void markAsRead(String id) {
    final notification = _notifications.firstWhere(
      (notification) => notification.id == id,
      orElse: () => throw Exception('Notification not found'),
    );
    notification.read = true;
  }

  // Method to clear all notifications
  void clearNotifications() {
    _notifications.clear();
  }
}

// Notification class to represent a notification
class Notification {
  final String id;
  final String title;
  final String message;
  final DateTime date;
  bool read;

  Notification({
    required this.id,
    required this.title,
    required this.message,
    required this.date,
    this.read = false,
  });
}
