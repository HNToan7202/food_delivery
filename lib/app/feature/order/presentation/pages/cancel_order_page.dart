import 'package:flutter/material.dart';

class CancelledOrderPage extends StatelessWidget {
  const CancelledOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Container(),
    );
  }
}
