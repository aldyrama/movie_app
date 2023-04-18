import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/sizes.dart';

class SettingWithRbItem extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool)? onChanged;

  const SettingWithRbItem({super.key, required this.title, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title,
            style: TextStyle(
                fontSize: Sizes.dp14(context),
                fontWeight: FontWeight.normal
            ),
          ),
        ),
        CupertinoSwitch(
          // overrides the default green color of the track
          activeColor: Colors.pink,
          value: value,
          // changes the state of the switch
          onChanged: onChanged,
        ),
      ],
    );
  }

}