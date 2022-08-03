part of './dashboard_screen.dart';

class _DrawerView extends StatelessWidget {
  const _DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        final dashboardCubit = context.read<DashboardCubit>();
        if (state.dashboardStateType == DashboardStateType.loading) {
          return const LoadingView();
        }
        return Drawer(
          child: SafeArea(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        dashboardCubit.getUser?.photoURL ??
                            Strings.profileSample),
                    radius: 40,
                  ),
                  title: const Text("Welcome"),
                  subtitle: Text(dashboardCubit.getUser?.displayName ?? "-"),
                  onTap: () => AutoRouter.of(context).pop(),
                ),
                const Divider(),
                ListTile(
                  title: const Text(Strings.logOutLabel),
                  onTap: () {
                    AutoRouter.of(context).pop();
                    context.read<AuthenticationCubit>().signOut();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
