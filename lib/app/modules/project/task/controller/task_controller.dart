import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'package:optimized_time/app/services/projects/project_service.dart';
import 'package:optimized_time/app/view_models/project_model.dart';
import 'package:optimized_time/app/view_models/project_task_model.dart';

part 'task_state.dart';

class TaskController extends Cubit<TaskStatus> {
  TaskController({
    required ProjectService projectService,
  })  : _projectService = projectService,
        super(TaskStatus.initial);

  late final ProjectModel _projectModel;
  final ProjectService _projectService;

  void setProject(ProjectModel projectModel) => _projectModel = projectModel;

  Future<void> register(String name, int duration) async {
    try {
      emit(TaskStatus.loading);
      final task = ProjectTaskModel(
        name: name,
        duration: duration,
      );
      await _projectService.addTask(
        _projectModel.id!,
        task,
      );
      emit(TaskStatus.success);
    } catch (e, s) {
      developer.log('Error when save task', error: e, stackTrace: s);
      emit(TaskStatus.failure);
    }
  }
}
