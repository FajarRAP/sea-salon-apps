import 'package:dartz/dartz.dart';
import 'package:sea_submission/core/failure.dart';
import 'package:sea_submission/features/review/domain/entities/review_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ReviewRemoteDataSources {
  Future insertReview(ReviewEntity review);
}

class ReviewRemoteDataSourcesImpl extends ReviewRemoteDataSources {
  final SupabaseClient supabase;

  ReviewRemoteDataSourcesImpl(this.supabase);

  @override
  Future<Either<Failure, String>> insertReview(ReviewEntity review) async {
    try {
      await supabase.from('reviews').insert({
        'customer_name': review.customerName,
        'comment': review.comment,
        'rating': review.rating,
      });

      return const Right('Berhasil Insert Data');
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
