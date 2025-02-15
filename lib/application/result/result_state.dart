import '../../data/models/diamond_model.dart';

abstract class ResultState {}

class ResultInitial extends ResultState {}

class ResultLoading extends ResultState {}

class ResultLoaded extends ResultState {
  final List<DiamondModel> diamonds;
  final bool isFilterApplied;

  ResultLoaded(this.diamonds, {this.isFilterApplied = false});
}

class ResultError extends ResultState {
  final String message;

  ResultError(this.message);
}
