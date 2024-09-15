// lib/models/job.dart

class Job {
  final String id;
  final String title;
  final String description;
  final String serviceProviderId;
  String status;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.serviceProviderId,
    this.status = 'available',
  });

  // Method to mark the job as completed
  void completeJob() {
    if (status == 'available') {
      status = 'completed';
    } else {
      throw Exception('Job is not available for completion');
    }
  }
}
