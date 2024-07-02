part of 'review_cubit.dart';

@immutable
sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}

class InsertReviewLoading extends ReviewState {}

class InsertReviewSuccess extends ReviewState {
  final String message;

  InsertReviewSuccess(this.message);
}

class InsertReviewError extends ReviewState {
  final String message;

  InsertReviewError(this.message);
}
