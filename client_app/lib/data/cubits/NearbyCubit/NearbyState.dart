part of 'NearbyCubit.dart';

@immutable
abstract class NearbyState {}

class NearbyInitial extends NearbyState {}

class NearbyLoading extends NearbyState {}

class NearbySuccess extends NearbyState {
  final NearbyModel myNearbyModel;
  NearbySuccess(this.myNearbyModel);
}

class NearbyError extends NearbyState {
  final String? error;
  NearbyError({this.error});
}
