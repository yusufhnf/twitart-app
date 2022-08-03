import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../utils/constant/lottie_assets.dart';
import '../utils/constant/strings.dart';

class EmptyView extends StatelessWidget {
  const EmptyView(
      {Key? key,
      this.isError = false,
      this.message = Strings.tweetEmptyMessage})
      : super(key: key);
  final bool isError;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            isError ? LottieAssets.error : LottieAssets.empty,
            width: 250.w,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
