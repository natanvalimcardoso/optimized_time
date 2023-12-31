import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:optimized_time/app/entities/project_status.dart';
import 'package:optimized_time/app/services/projects/project_service.dart';
import 'package:optimized_time/app/view_models/project_model.dart';

part 'home_status.dart';

class HomeController extends Cubit<HomeState> {
  HomeController({
    required ProjectService projectService,
  })  : _projectService = projectService,
        super(HomeState.initial());
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final ProjectService _projectService;

  Future<void> loadProjects() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final projects = await _projectService.findByStatus(state.projectFilter);
      emit(state.copyWith(status: HomeStatus.complete, projects: projects));
    } catch (e, s) {
      log('Error to find projects', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> filter(ProjectStatus status) async {
    emit(state.copyWith(status: HomeStatus.loading, projects: []));
    final projects = await _projectService.findByStatus(status);
    emit(
      state.copyWith(
        status: HomeStatus.complete,
        projects: projects,
        projectFilter: status,
      ),
    );
  }

  // ignore: always_declare_return_types
  logout() async {
    await _firebaseAuth.signOut();
    await Modular.to.pushReplacementNamed('/login/');
  }

  void updateList() => filter(state.projectFilter);
}
