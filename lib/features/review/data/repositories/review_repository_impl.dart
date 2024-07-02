import 'package:dartz/dartz.dart';
import 'package:sea_submission/core/failure.dart';
import 'package:sea_submission/features/review/data/datasources/remote_datasources.dart';
import 'package:sea_submission/features/review/domain/entities/review_entity.dart';
import 'package:sea_submission/features/review/domain/repositories/review_repository.dart';

class ReviewRepositoryImpl extends ReviewRepository {
  final ReviewRemoteDataSources remote;

  ReviewRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<ReviewEntity>>> getReviews() {
    // TODO: implement getReviews
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> insertReview(ReviewEntity review) async =>
      await remote.insertReview(review);
}
