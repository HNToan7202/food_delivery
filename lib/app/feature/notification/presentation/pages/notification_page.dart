import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List notificationArr = [
    {
      "title": "Your orders has been picked up",
      "time": "Now",
    },
    {
      "title": "Your order has been delivered",
      "time": "1 h ago",
    },
    {
      "title": "Your orders has been picked up",
      "time": "3 h ago",
    },
    {
      "title": "Your order has been delivered",
      "time": "5 h ago",
    },
    {
      "title": "Your orders has been picked up",
      "time": "05 Jun 2023",
    },
    {
      "title": "Your order has been delivered",
      "time": "05 Jun 2023",
    },
    {
      "title": "Your orders has been picked up",
      "time": "06 Jun 2023",
    },
    {
      "title": "Your order has been delivered",
      "time": "06 Jun 2023",
    },
  ];

  void loadData() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Thông báo",
          style: TextStyle(
              color: AppColorScheme.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w800),
        ),
        elevation: 0,
        backgroundColor: AppColorScheme.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: notificationArr.length,
              separatorBuilder: ((context, index) => Divider(
                    indent: 25,
                    endIndent: 25,
                    color: AppColorScheme.secondaryText.withOpacity(0.4),
                    height: 1,
                  )),
              itemBuilder: ((context, index) {
                var cObj = notificationArr[index] as Map? ?? {};
                return Container(
                  decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? AppColorScheme.white
                          : AppColorScheme.textfield),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: AppColorScheme.kPrimary,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cObj["title"].toString(),
                              style: TextStyle(
                                  color: AppColorScheme.primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              cObj["time"].toString(),
                              style: TextStyle(
                                  color: AppColorScheme.secondaryText,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
