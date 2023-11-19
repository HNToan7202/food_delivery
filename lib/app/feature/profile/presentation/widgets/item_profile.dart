import 'package:flutter/material.dart';

import '../../../../../common/color_extension.dart';

class ItemProfile extends StatelessWidget {
  final String attribute;
  final String value;
  final VoidCallback onTap;

  const ItemProfile({
    Key? key,
    required this.attribute,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(attribute,
                    style: const TextStyle(
                        fontSize: 13,
                        color: AppColorScheme.inkDarkGray,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                Text(value,
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColorScheme.inkDark,
                    )),
              ],
            ),
            attribute == "Số điện thoại" || attribute == "Địa chỉ email"
                ? const SizedBox.shrink()
                : IconButton(
                    onPressed: onTap, icon: const Icon(Icons.edit_outlined))
          ],
        ),
      ],
    );
  }
}
