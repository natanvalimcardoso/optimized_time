import 'package:optimized_time/app/entities/project_status.dart';
import 'package:optimized_time/app/view_models/project_model.dart';
import 'package:optimized_time/app/view_models/project_task_model.dart';

abstract class ProjectService {
  Future<void> register(ProjectModel project);
  Future<List<ProjectModel>> findByStatus(ProjectStatus status);
  Future<ProjectModel> findById(int projectId);
  Future<ProjectModel> addTask(int projectId, ProjectTaskModel task);
  Future<void> finishProject(int projectId);
}
