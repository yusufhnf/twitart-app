part of 'authentication_cubit.dart';

enum LoginProcess { initial, loading, success, error }

class AuthenticationState extends Equatable {
  const AuthenticationState(
      {this.loginProcess = LoginProcess.initial, this.errorHandler});

  final LoginProcess loginProcess;
  final ErrorHandler? errorHandler;

  @override
  List<Object> get props => [
        loginProcess,
        errorHandler ?? ErrorHandler.error(Strings.somethingWrongLabel)
      ];

  AuthenticationState copyWith(
      {LoginProcess? loginProcessValue, ErrorHandler? errorHandlerValue}) {
    return AuthenticationState(
        loginProcess: loginProcessValue ?? loginProcess,
        errorHandler: errorHandlerValue ?? errorHandler);
  }
}
