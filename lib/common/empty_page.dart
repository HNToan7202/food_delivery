import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class PageEmpty extends StatelessWidget {
  const PageEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 140,
            height: 140,
            child: Image.asset(
              Assets.images.source.path,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Bạn chưa có đơn hàng nào. Hãy đặt hàng ngay!"),
        ],
      ),
    );
  }
}
