import 'package:flutter/material.dart';
import '../../../../app_index.dart';

class HomeActionWidget extends StatelessWidget {
  const HomeActionWidget({
    Key? key,
    required this.actionName,
    required this.icon
  }) : super(key: key);

  final String actionName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
          color: JongNhamAppColors.MAINCOLOR,
        ),
        const SizedBox(height: 5,),
        Text(actionName,
          style: const TextStyle(
            fontSize: 12
          ),
        )
      ],
    );
  }
}
