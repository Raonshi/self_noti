import 'package:flutter/material.dart';
import 'package:self_noti/style/styles.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('알림이 없습니다', style: guideTextStyle));
  }
}
