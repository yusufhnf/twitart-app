import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:twitart_app/src/infrastructure/helper/date_time_helper.dart';
import 'package:twitart_app/src/infrastructure/utils/constant/strings.dart';
import 'package:twitart_app/src/infrastructure/widgets/bottom_dialog.dart';
import 'package:twitart_app/src/presentation/dashboard/dashboard_bloc/dashboard_cubit.dart';

import '../../infrastructure/models/tweet_model.dart';

class TweetItem extends StatelessWidget {
  const TweetItem({Key? key, required this.tweet}) : super(key: key);

  final TweetModel tweet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage:
                NetworkImage(tweet.authorImage ?? Strings.profileSample),
            radius: 20,
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          tweet.authorName ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: Text(
                          " • ${tweet.timestamp.toDate().dateTimeAgo()}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (context.read<DashboardCubit>().getUser?.uid ==
                      tweet.authorId)
                    GestureDetector(
                        onTap: () => BottomDialog.showMore(
                            context: context, tweet: tweet),
                        child: const Icon(Ionicons.ellipsis_horizontal))
                ],
              ),
              const SizedBox(height: 8.0),
              Text(tweet.text ?? ""),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const IconCount(
                      icon: Ionicons.chatbox_ellipses_outline, count: 0),
                  IconCount(
                      icon: Ionicons.repeat_outline, count: tweet.retweets),
                  IconCount(icon: Ionicons.heart_outline, count: tweet.likes),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

class IconCount extends StatelessWidget {
  const IconCount({Key? key, required this.icon, required this.count})
      : super(key: key);
  final IconData icon;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(icon), const SizedBox(width: 8), Text("$count")],
    );
  }
}
