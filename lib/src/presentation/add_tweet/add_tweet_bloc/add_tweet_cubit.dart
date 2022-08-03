import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitart_app/src/infrastructure/data/remote/repository/auth_repository.dart';
import 'package:twitart_app/src/infrastructure/utils/constant/strings.dart';
import '../../../infrastructure/data/remote/repository/tweet_repository.dart';
import '../../../infrastructure/helper/error_handler.dart';
import '../../../infrastructure/models/tweet_model.dart';

part 'add_tweet_state.dart';

class AddTweetCubit extends Cubit<AddTweetState> {
  AddTweetCubit() : super(const AddTweetState());
  final TweetsRepository _tweetsRepository = TweetsRepository();
  final AuthRepository _authRepository = AuthRepository();
  final tweetController = TextEditingController();

  void addTweet() async {
    if (tweetController.text.isNotEmpty) {
      emit(state.copyWith(addTweetTypeValue: AddTweetType.loading));
      try {
        final currentUser = await _authRepository.getUser();
        final newTweet = TweetModel(
            authorId: currentUser?.uid,
            authorImage: currentUser?.photoURL,
            authorName: currentUser?.displayName,
            text: tweetController.text,
            timestamp: Timestamp.now());
        await _tweetsRepository.addTweets(newTweet);
        emit(state.copyWith(addTweetTypeValue: AddTweetType.success));
      } on FirebaseException catch (e) {
        emit(state.copyWith(
            addTweetTypeValue: AddTweetType.error,
            errorHandlerValue: ErrorHandler.error(e)));
      } catch (e) {
        emit(state.copyWith(
            addTweetTypeValue: AddTweetType.error,
            errorHandlerValue: ErrorHandler.error(e)));
      }
    }
  }

  void editTweet(
      {required TweetModel currentTweet, required String newTweet}) async {
    if (tweetController.text.isNotEmpty) {
      emit(state.copyWith(addTweetTypeValue: AddTweetType.loading));
      try {
        await _tweetsRepository.editTweet(
            tweet: currentTweet, newTweet: newTweet);
        emit(state.copyWith(addTweetTypeValue: AddTweetType.success));
      } on FirebaseException catch (e) {
        emit(state.copyWith(
            addTweetTypeValue: AddTweetType.error,
            errorHandlerValue: ErrorHandler.error(e)));
      } catch (e) {
        emit(state.copyWith(
            addTweetTypeValue: AddTweetType.error,
            errorHandlerValue: ErrorHandler.error(e)));
      }
    }
  }
}
