// job_service.dart
import 'package:my_balemoya_app/Itu/models/job.dart';

class JobService {
  List<Job> jobs = [
    Job(
        id: '1',
        title: 'Design a logo',
        status: 'available',
        description: '',
        serviceProviderId: ''),
    Job(
        id: '2',
        title: 'Build a website',
        status: 'completed',
        description: '',
        serviceProviderId: ''),
  ];

  Future<List<Job>> getAvailableJobs() async {
    // Return jobs with status 'available'
    return jobs.where((job) => job.status == 'available').toList();
  }

  Future<void> completeJob(int jobId) async {
    // Mark job as completed and deduct commission
    final job = jobs.firstWhere((job) => job.id == jobId);
    job.status = 'completed';
  }
}

// job_list.dart
