import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:sea_submission/core/common/snackbar.dart';
import 'package:sea_submission/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sea_submission/features/review/domain/entities/review_entity.dart';
import 'package:sea_submission/features/review/presentation/cubit/review_cubit.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final commentController = TextEditingController();
  double rate = 0.0;

  @override
  Widget build(BuildContext context) {
    final reviewCubit = context.read<ReviewCubit>();
    final authCubit = context.read<AuthCubit>();

    return BlocListener<ReviewCubit, ReviewState>(
      listener: (context, state) {
        if (state is InsertReviewError) {
          errorSnackbar(state.message, context);
        }
        if (state is InsertReviewSuccess) {
          successSnackbar(state.message, context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Review'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingStars(
                animationDuration: const Duration(seconds: 1),
                onValueChanged: (value) => setState(() => rate = value),
                starSize: 24,
                value: rate,
                valueLabelRadius: 8,
                valueLabelPadding: const EdgeInsets.all(8),
                valueLabelTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                maxValueVisibility: false,
                valueLabelVisibility: false,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: commentController,
                decoration: const InputDecoration(hintText: 'Comment'),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () async {
                    reviewCubit.insertReview(
                      ReviewEntity(
                        customerName:
                            authCubit.currentUser?.userMetadata?['name'] ??
                                'Null Name',
                        comment: commentController.text.trim(),
                        rating: rate,
                      ),
                    );
                  },
                  child: BlocBuilder<ReviewCubit, ReviewState>(
                    builder: (context, state) {
                      if (state is InsertReviewLoading) {
                        return const CircularProgressIndicator();
                      }
                      return const Text('Send');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
