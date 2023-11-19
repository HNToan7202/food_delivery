import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import '../../../../../common/btn/btn_default.dart';
import '../../../../../common/input/input_default.dart';
import '../../../../../common/utils/bottom_sheet_utils.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, "Địa chỉ đã lưu");
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        title:
            const Text("Địa chỉ đã lưu", style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Địa điểm của tôi"),
                Text("2/5"),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Icon(Icons.location_on_outlined),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Địa chỉ nhà"),
                    Text("KTX Khu B, ĐHQG TPHCM"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () {
                update(context: context, title: "Địa chỉ", name: "KTX Khu B");
              },
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColorScheme.kPrimary),
                  const SizedBox(
                    width: 8,
                  ),
                  Text("Thêm địa chỉ mới",
                      style: TextStyle(color: AppColorScheme.kPrimary)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String> update({
    required BuildContext context,
    required String title,
    required String name,
  }) async {
    TextEditingController txtName = TextEditingController();
    final nameNumber = await BottomSheetUtils.showMaterial(
      context: context,
      isScrollControlled: false,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Cập nhật $title",
                    style: const TextStyle(
                        fontSize: 20,
                        color: AppColorScheme.inkDark,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputDefault(
                    controller: txtName,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      hintText: "Nhập tên vd: Nhà, Công ty, ...",
                      hintStyle: TextStyle(color: AppColorScheme.secondaryText),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColorScheme.bg,
                    ),
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputDefault(
                    controller: txtName,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      hintText: "Địa chỉ",
                      hintStyle: TextStyle(color: AppColorScheme.secondaryText),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColorScheme.bg,
                    ),
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputDefault(
                    controller: txtName,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      hintText: "Ghi chú",
                      hintStyle: TextStyle(color: AppColorScheme.secondaryText),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColorScheme.bg,
                    ),
                    obscureText: false,
                  ),
                ],
              ),
              BtnDefault(
                title: "Lưu",
                onTap: () {
                  Navigator.pop(context, txtName.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
    return nameNumber ?? name;
  }
}
