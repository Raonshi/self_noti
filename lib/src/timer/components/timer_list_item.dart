import 'package:flutter/material.dart';
import 'package:self_noti/style/styles.dart';

class TimerListItem extends StatelessWidget {
  const TimerListItem({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('00:00:00', style: titleMediumStyle),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            fixedSize: const Size(48, 48),
          ),
          onPressed: () {},
          child: Text(
            '정지',
            style: buttonTextSmallStyle,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            fixedSize: const Size(48, 48),
          ),
          onPressed: () {},
          child: Text('일시\n정지', style: buttonTextSmallStyle),
        ),
      ],
    );
  }
}
