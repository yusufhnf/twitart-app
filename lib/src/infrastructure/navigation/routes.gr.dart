// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:twitart_app/src/infrastructure/models/tweet_model.dart' as _i7;
import 'package:twitart_app/src/infrastructure/navigation/session_guard.dart'
    as _i6;
import 'package:twitart_app/src/presentation/add_tweet/add_tweet_screen.dart'
    as _i3;
import 'package:twitart_app/src/presentation/dashboard/dashboard_screen.dart'
    as _i2;
import 'package:twitart_app/src/presentation/login/login_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter(
      {_i5.GlobalKey<_i5.NavigatorState>? navigatorKey,
      required this.sessionGuard})
      : super(navigatorKey);

  final _i6.SessionGuard sessionGuard;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    DashboardScreenRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.DashboardScreen());
    },
    AddTweetScreenRoute.name: (routeData) {
      final args = routeData.argsAs<AddTweetScreenRouteArgs>(
          orElse: () => const AddTweetScreenRouteArgs());
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.AddTweetScreen(
              key: args.key, currentTweet: args.currentTweet));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login-screen', fullMatch: true),
        _i4.RouteConfig(LoginScreenRoute.name,
            path: '/login-screen', guards: [sessionGuard]),
        _i4.RouteConfig(DashboardScreenRoute.name, path: '/dashboard-screen'),
        _i4.RouteConfig(AddTweetScreenRoute.name, path: '/add-screen')
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreenRoute extends _i4.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(LoginScreenRoute.name, path: '/login-screen');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i2.DashboardScreen]
class DashboardScreenRoute extends _i4.PageRouteInfo<void> {
  const DashboardScreenRoute()
      : super(DashboardScreenRoute.name, path: '/dashboard-screen');

  static const String name = 'DashboardScreenRoute';
}

/// generated route for
/// [_i3.AddTweetScreen]
class AddTweetScreenRoute extends _i4.PageRouteInfo<AddTweetScreenRouteArgs> {
  AddTweetScreenRoute({_i5.Key? key, _i7.TweetModel? currentTweet})
      : super(AddTweetScreenRoute.name,
            path: '/add-screen',
            args:
                AddTweetScreenRouteArgs(key: key, currentTweet: currentTweet));

  static const String name = 'AddTweetScreenRoute';
}

class AddTweetScreenRouteArgs {
  const AddTweetScreenRouteArgs({this.key, this.currentTweet});

  final _i5.Key? key;

  final _i7.TweetModel? currentTweet;

  @override
  String toString() {
    return 'AddTweetScreenRouteArgs{key: $key, currentTweet: $currentTweet}';
  }
}
