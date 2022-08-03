part of './dashboard_screen.dart';

class _TweetListView extends StatelessWidget {
  const _TweetListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state.dashboardStateType == DashboardStateType.loading) {
          return const LoadingView();
        } else if (state.dashboardStateType == DashboardStateType.empty) {
          return const EmptyView();
        } else if (state.dashboardStateType == DashboardStateType.error) {
          return EmptyView(
            isError: true,
            message: state.errorHandler?.getErrorMessage ??
                Strings.somethingWrongLabel,
          );
        } else if (state.dashboardStateType == DashboardStateType.success) {
          final tweetResult = state.tweets;
          return ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) => TweetItem(
                    tweet: tweetResult[index],
                  ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: tweetResult.length);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
