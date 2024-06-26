import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PlatformLoadingIndicator extends StatelessWidget {
  const PlatformLoadingIndicator({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Center(
        child: CircularProgressIndicator(
          color: color,
        ),
      );
    } else {
      return Center(
        child: CupertinoActivityIndicator(
          radius: 16,
          color: color,
        ),
      );
    }
  }
}

Widget loadingIndicator =
    const SpinKitThreeBounce(size: 45, color: Colors.blue);