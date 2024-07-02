import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sea_submission/features/reservation/domain/entities/reservation_entity.dart';
import 'package:sea_submission/features/reservation/domain/usecases/make_reservation_use_case.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit({
    required this.makeReservationUseCase,
  }) : super(ReservationInitial());
  final MakeReservationUseCase makeReservationUseCase;

  Future<void> makeReservation(ReservationEntity reservation) async {
    emit(ReservationLoading());
    final result = await makeReservationUseCase.execute(reservation);
    result.fold(
      (l) => emit(ReservationError(l.message)),
      (r) => emit(ReservationLoaded(r)),
    );
  }
}
