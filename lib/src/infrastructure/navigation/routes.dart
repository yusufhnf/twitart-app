import 'package:auto_route/auto_route.dart';

import '../../presentation/add_tweet/add_tweet_screen.dart';
import '../../presentation/dashboard/dashboard_screen.dart';
import '../../presentation/login/login_screen.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  LoginScreen.route,
  DashboardScreen.route,
  AddTweetScreen.route
])
class $AppRouter {}
