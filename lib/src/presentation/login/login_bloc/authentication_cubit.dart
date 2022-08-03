import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/data/remote/repository/auth_repository.dart';
import '../../../infrastructure/helper/error_handler.dart';
import '../../../infrastructure/utils/constant/strings.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationState());
  final AuthRepository _authRepository = AuthRepository();

  void signInWithGoogle() async {
    emit(state.copyWith(loginProcessValue: LoginProcess.loading));
    try {
      final uidId = await _authRepository.signInWithGoogle();
      if (uidId != null) {
        emit(state.copyWith(loginProcessValue: LoginProcess.success));
      } else {
        emit(state.copyWith(loginProcessValue: LoginProcess.error));
      }
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          loginProcessValue: LoginProcess.error,
          errorHandlerValue: ErrorHandler.error(e)));
    } catch (e) {
      emit(state.copyWith(
          loginProcessValue: LoginProcess.error,
          errorHandlerValue: ErrorHandler.error(e)));
    }
  }

  void signOut() async {
    emit(state.copyWith(loginProcessValue: LoginProcess.loading));
    try {
      await _authRepository.signOut();
      emit(state.copyWith(loginProcessValue: LoginProcess.success));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          loginProcessValue: LoginProcess.error,
          errorHandlerValue: ErrorHandler.error(e)));
    } catch (e) {
      emit(state.copyWith(
          loginProcessValue: LoginProcess.error,
          errorHandlerValue: ErrorHandler.error(e)));
    }
  }
}
