import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../page/res_detail_body.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ResDetailBody widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(widget.res.logo),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.res.name,
                  style: Theme.of(context).textTheme.headline6),
              const SizedBox(
                height: 8,
              ),
              Text(widget.res.address,
                  style: Theme.of(context).textTheme.subtitle1),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Image.asset(Assets.images.rate.path, width: 15, height: 15),
                  const SizedBox(
                    width: 4,
                  ),
                  Text("4.8", style: Theme.of(context).textTheme.caption),
                  const SizedBox(
                    width: 4,
                  ),
                  Text("(124 Review)",
                      style: Theme.of(context).textTheme.caption),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
