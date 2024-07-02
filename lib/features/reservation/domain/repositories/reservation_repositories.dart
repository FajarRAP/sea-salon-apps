import 'package:dartz/dartz.dart';
import 'package:sea_submission/core/failure.dart';
import 'package:sea_submission/features/reservation/domain/entities/reservation_entity.dart';

abstract class ReservationRepositories {
  Future<Either<Failure, String>> insertReservation(ReservationEntity reservation);
}