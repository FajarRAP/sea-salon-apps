import 'package:dartz/dartz.dart';
import 'package:sea_submission/core/failure.dart';
import 'package:sea_submission/features/reservation/domain/entities/reservation_entity.dart';
import 'package:sea_submission/features/reservation/domain/repositories/reservation_repositories.dart';

class MakeReservationUseCase {
  final ReservationRepositories reservationRepositories;

  MakeReservationUseCase(this.reservationRepositories);

  Future<Either<Failure, String>> execute(
          ReservationEntity reservation) async =>
      await reservationRepositories.insertReservation(reservation);
}
