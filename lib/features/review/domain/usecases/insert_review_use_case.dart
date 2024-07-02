import 'package:dartz/dartz.dart';
import 'package:sea_submission/core/failure.dart';
import 'package:sea_submission/features/review/domain/entities/review_entity.dart';
import 'package:sea_submission/features/review/domain/repositories/review_repository.dart';

class InsertReviewUseCase {
  final ReviewRepository reviewRepository;

  InsertReviewUseCase(this.reviewRepository);

  Future<Either<Failure, String>> execute(ReviewEntity review) async =>
      await reviewRepository.insertReview(review);
}
