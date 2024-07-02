part of 'reservation_cubit.dart';

@immutable
sealed class ReservationState {}

final class ReservationInitial extends ReservationState {}

class ReservationLoading extends ReservationState {}

class ReservationLoaded extends ReservationState {
  final String message;

  ReservationLoaded(this.message);
}

class ReservationError extends ReservationState {
  final String message;

  ReservationError(this.message);
}
