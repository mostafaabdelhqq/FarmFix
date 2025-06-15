part of 'soilgrids_cubit.dart';

@immutable
sealed class SoilGridsState {}

class SoilGridsInitial extends SoilGridsState {}

class SoilGridsLoading extends SoilGridsState {}

class SoilGridsLoaded extends SoilGridsState {
  final SoilDataModel soilDataModel;

  SoilGridsLoaded(this.soilDataModel);
}

class SoilGridsError extends SoilGridsState {
  final String message;

  SoilGridsError(this.message);
}
