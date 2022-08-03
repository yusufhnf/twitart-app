import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/constant/lottie_assets.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(LottieAssets.loading, height: 100),
    );
  }
}
