import 'package:dartz/dartz.dart';
import 'package:sea_submission/core/failure.dart';
import 'package:sea_submission/features/review/domain/entities/review_entity.dart';

abstract class ReviewRepository {
  Future<Either<Failure, String>> insertReview(ReviewEntity review);
  Future<Either<Failure, List<ReviewEntity>>> getReviews();
}