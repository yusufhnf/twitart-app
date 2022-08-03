import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitart_app/src/infrastructure/models/tweet_model.dart';

import '../../infrastructure/navigation/routes.gr.dart';
import '../../infrastructure/utils/constant/strings.dart';
import '../../infrastructure/widgets/bottom_dialog.dart';
import '../../infrastructure/widgets/loading_dialog.dart';
import 'add_tweet_bloc/add_tweet_cubit.dart';

class AddTweetScreen extends StatelessWidget {
  const AddTweetScreen({Key? key, this.currentTweet}) : super(key: key);
  final TweetModel? currentTweet;
  static const route = AdaptiveRoute(path: '/add-screen', page: AddTweetScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            currentTweet != null ? Strings.editTweet : Strings.addTweetLabel),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: BlocProvider<AddTweetCubit>(
        create: (context) => AddTweetCubit(),
        child: BlocListener<AddTweetCubit, AddTweetState>(
          listener: (context, state) {
            if (state.addTweetType == AddTweetType.loading) {
              LoadingDialog.openDialog(context);
            } else if (state.addTweetType == AddTweetType.success) {
              LoadingDialog.close(context);
              AutoRouter.of(context)
                  .popUntilRouteWithName(DashboardScreenRoute.name);
              BottomDialog.showInformation(
                  context: context,
                  description: Strings.addTweetSuccessMessage,
                  isSuccess: true);
            } else if (state.addTweetType == AddTweetType.error) {
              LoadingDialog.close(context);
              BottomDialog.showInformation(
                  context: context,
                  description: state.errorHandler?.getErrorMessage ??
                      Strings.somethingWrongLabel,
                  isSuccess: false);
            }
          },
          child: BlocBuilder<AddTweetCubit, AddTweetState>(
            builder: (context, state) {
              final addTweetCubit = context.read<AddTweetCubit>();
              if (currentTweet != null) {
                addTweetCubit.tweetController.text = currentTweet?.text ?? "";
              }
              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            maxLines: 5,
                            maxLength: 280,
                            controller: addTweetCubit.tweetController,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                labelText: Strings.contentFormLabel,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.red),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ],
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                final tweet = currentTweet;
                                if (tweet != null) {
                                  addTweetCubit.editTweet(
                                      currentTweet: tweet,
                                      newTweet: state.contentText ?? "");
                                } else {
                                  addTweetCubit.addTweet();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: const Text(Strings.saveLabel))),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
