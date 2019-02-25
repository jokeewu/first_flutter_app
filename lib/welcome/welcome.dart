/// 欢迎界面

import 'package:flutter/material.dart';
import '../common/router.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GestureDetector(
          onTap: () {
            router.navigateTo(context, '/index', replace: true);
          },
          child: Text('Welcome'),
        ),
      ),
    );
  }
}
