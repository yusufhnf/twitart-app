import 'package:auto_route/auto_route.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../data/remote/repository/auth_repository.dart';
import 'routes.gr.dart';

class SessionGuard extends AutoRouteGuard {
  final AuthRepository _authRepository = AuthRepository();
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isHaveUID = await _authRepository.getUserUID();
    if (isHaveUID != null) {
      router.replace(const DashboardScreenRoute());
    } else {
      resolver.next(true);
    }
    FlutterNativeSplash.remove();
  }
}
