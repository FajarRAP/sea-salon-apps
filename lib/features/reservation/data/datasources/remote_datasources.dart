import 'package:dartz/dartz.dart';
import 'package:sea_submission/core/failure.dart';
import 'package:sea_submission/features/reservation/domain/entities/reservation_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ReservationRemoteDataSources {
  Future insertReservation(ReservationEntity reservation);
}

class ReservationRemoteDataSourcesImpl extends ReservationRemoteDataSources {
  final SupabaseClient supabase;

  ReservationRemoteDataSourcesImpl(this.supabase);

  @override
  Future<Either<Failure, String>> insertReservation(
      ReservationEntity reservation) async {
    try {
      await supabase.from('reservations').insert({
        'name': reservation.name,
        'phone': reservation.phone,
        'service_type': reservation.serviceType,
        'time': reservation.time,
      });
      return const Right('Make Reservation Successful');
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
