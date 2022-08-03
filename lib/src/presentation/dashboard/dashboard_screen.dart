import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:twitart_app/src/presentation/dashboard/todo_item.dart';

import '../../infrastructure/navigation/routes.gr.dart';
import '../../infrastructure/utils/constant/strings.dart';
import '../../infrastructure/widgets/empty_view.dart';
import '../../infrastructure/widgets/loading_dialog.dart';
import '../../infrastructure/widgets/loading_view.dart';
import '../login/login_bloc/authentication_cubit.dart';
import 'dashboard_bloc/dashboard_cubit.dart';

part './_drawer_view.dart';
part './_tweet_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const route =
      AdaptiveRoute(path: '/dashboard-screen', page: DashboardScreen);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (context) => AuthenticationCubit(),
        ),
        BlocProvider<DashboardCubit>(
          create: (context) => DashboardCubit()..getTweetData(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.yourTweetLabel),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await AutoRouter.of(context).push(AddTweetScreenRoute());
          },
          backgroundColor: Colors.red,
          child: const Icon(
            Ionicons.create_outline,
            color: Colors.white,
          ),
        ),
        drawer: const _DrawerView(),
        body: BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            if (state.loginProcess == LoginProcess.success) {
              LoadingDialog.close(context);
              AutoRouter.of(context).replace(const LoginScreenRoute());
            } else if (state.loginProcess == LoginProcess.loading) {
              LoadingDialog.openDialog(context);
            } else if (state.loginProcess == LoginProcess.error) {
              LoadingDialog.close(context);
            }
          },
          child: const _TweetListView(),
        ),
      ),
    );
  }
}
