part of 'home_controller.dart';

enum HomeStatus {
  initial,
  loading,
  complete,
  failure;
}

class HomeState extends Equatable {

  HomeState.initial()
      : this._(
          projects: [],
          projectFilter: ProjectStatus.inLoading,
          status: HomeStatus.initial,
        );

  const HomeState._({
    required this.projects,
    required this.status,
    required this.projectFilter,
  });
  final List<ProjectModel> projects;
  final HomeStatus status;
  final ProjectStatus projectFilter;

  @override
  List<Object?> get props => [projects, status, projectFilter];

  HomeState copyWith({
    List<ProjectModel>? projects,
    HomeStatus? status,
    ProjectStatus? projectFilter,
  }) {
    return HomeState._(
      projects: projects ?? this.projects,
      status: status ?? this.status,
      projectFilter: projectFilter ?? this.projectFilter,
    );
  }
}
