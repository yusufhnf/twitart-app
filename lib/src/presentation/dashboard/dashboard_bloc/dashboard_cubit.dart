import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitart_app/src/infrastructure/helper/error_handler.dart';
import 'package:twitart_app/src/infrastructure/utils/constant/strings.dart';

import '../../../infrastructure/data/remote/repository/auth_repository.dart';
import '../../../infrastructure/data/remote/repository/tweet_repository.dart';
import '../../../infrastructure/models/tweet_model.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());
  final _tweetRepository = TweetsRepository();
  final _authRepository = AuthRepository();
  late final User currentUser;

  User? get getUser => state.currentUser;

  void getTweetData() async {
    emit(state.copyWith(dashboardStateTypeValue: DashboardStateType.loading));
    try {
      final result = await _tweetRepository.getTweets();
      final currentUser = await _authRepository.getUser();
      if (currentUser != null) {
        emit(state.copyWith(currentUserValue: currentUser));
      }
      result.listen((value) {
        if (value.isEmpty) {
          emit(state.copyWith(
              dashboardStateTypeValue: DashboardStateType.empty));
        } else {
          emit(state.copyWith(
              dashboardStateTypeValue: DashboardStateType.success,
              tweetValue: value));
        }
      });
    } on FirebaseException catch (e) {
      emit(state.copyWith(
          dashboardStateTypeValue: DashboardStateType.error,
          errorHandlerValue: ErrorHandler.error(e)));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(dashboardStateTypeValue: DashboardStateType.error));
    }
  }

  void deleteTweet(TweetModel tweet) async {
    try {
      await _tweetRepository.deleteTweet(tweet);
      emit(state.copyWith(dashboardStateTypeValue: DashboardStateType.success));
    } on FirebaseException catch (e) {
      emit(state.copyWith(
          dashboardStateTypeValue: DashboardStateType.error,
          errorHandlerValue: ErrorHandler.error(e)));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
