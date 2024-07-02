import 'package:dartz/dartz.dart';
import 'package:sea_submission/core/failure.dart';
import 'package:sea_submission/features/reservation/data/datasources/remote_datasources.dart';
import 'package:sea_submission/features/reservation/domain/entities/reservation_entity.dart';
import 'package:sea_submission/features/reservation/domain/repositories/reservation_repositories.dart';

class ReservationRepositoriesImpl extends ReservationRepositories {
  final ReservationRemoteDataSources remote;

  ReservationRepositoriesImpl(this.remote);
  @override
  Future<Either<Failure, String>> insertReservation(
          ReservationEntity reservation) async =>
      await remote.insertReservation(reservation);
}
