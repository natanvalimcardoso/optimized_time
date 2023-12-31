import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'package:optimized_time/app/entities/project_status.dart';
import 'package:optimized_time/app/services/projects/project_service.dart';
import 'package:optimized_time/app/view_models/project_model.dart';
part 'project_register_state.dart';

class ProjectRegisterController extends Cubit<ProjectRegisterStatus> {
  ProjectRegisterController({
    required ProjectService projectService,
  })  : _projectService = projectService,
        super(ProjectRegisterStatus.initial);

  final ProjectService _projectService;

  Future<void> register(String name, int estimate) async {
    try {
      emit(ProjectRegisterStatus.loading);
      final project = ProjectModel(
        name: name,
        estimate: estimate,
        status: ProjectStatus.inLoading,
        tasks: [],
      );
      await _projectService.register(project);
      emit(ProjectRegisterStatus.success);
    } catch (e, s) {
      developer.log('Error to save project', error: e, stackTrace: s);
      emit(ProjectRegisterStatus.failure);
    }
  }
}
