import 'package:sea_submission/features/review/domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  ReviewModel({
    required super.customerName,
    required super.comment,
    required super.rating,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
      customerName: json['customer_name'],
      comment: json['comment'],
      rating: json['rating']);

  Map<String, dynamic> toJson() => {
        'customer_name': customerName,
        'comment': comment,
        'rating': rating,
      };
}
