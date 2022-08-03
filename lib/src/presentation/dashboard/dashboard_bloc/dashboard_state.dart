part of 'dashboard_cubit.dart';

enum DashboardStateType { initial, loading, success, empty, error }

class DashboardState extends Equatable {
  const DashboardState(
      {this.dashboardStateType = DashboardStateType.initial,
      this.tweets = const [],
      this.currentUser,
      this.errorHandler});

  final DashboardStateType dashboardStateType;
  final List<TweetModel> tweets;
  final User? currentUser;
  final ErrorHandler? errorHandler;

  @override
  List<Object> get props => [
        dashboardStateType,
        tweets,
        currentUser ?? User,
        errorHandler ?? Exception(Strings.somethingWrongLabel)
      ];

  DashboardState copyWith(
      {DashboardStateType? dashboardStateTypeValue,
      List<TweetModel>? tweetValue,
      User? currentUserValue,
      ErrorHandler? errorHandlerValue}) {
    return DashboardState(
        dashboardStateType: dashboardStateTypeValue ?? dashboardStateType,
        tweets: tweetValue ?? tweets,
        currentUser: currentUserValue ?? currentUser,
        errorHandler: errorHandlerValue ?? errorHandler);
  }
}
