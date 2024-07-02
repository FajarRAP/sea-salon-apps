import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sea_submission/features/review/domain/entities/review_entity.dart';
import 'package:sea_submission/features/review/domain/usecases/insert_review_use_case.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit({
    required this.insertReviewUseCase,
  }) : super(ReviewInitial());

  final InsertReviewUseCase insertReviewUseCase;

  Future<void> insertReview(ReviewEntity review) async {
    emit(InsertReviewLoading());

    final result = await insertReviewUseCase.execute(review);

    result.fold(
      (l) => emit(InsertReviewError(l.message)),
      (r) => emit(InsertReviewSuccess(r)),
    );
  }
}
