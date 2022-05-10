import 'package:flutter/material.dart';
import 'package:youtube/utils/theme_constants.dart';

class LoadingUI extends StatelessWidget {
  LoadingUI();
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: primaryLight,
        valueColor: AlwaysStoppedAnimation<Color>(greyColor),
        strokeWidth: 2,
      ),
    );
  }
}
