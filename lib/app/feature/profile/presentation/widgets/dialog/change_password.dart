import 'package:flutter/material.dart';

import '../../../../../../common/btn/btn_default.dart';
import '../../../../../../common/color_extension.dart';
import '../../../../../../common/input/input_default.dart';
import '../../../../../../common/utils/bottom_sheet_utils.dart';
import '../../../data/model/change_password_request.dart';

Future<ChangePasswordReq> changePassword({
  required BuildContext context,
}) async {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final key = GlobalKey<FormState>();
  final formRequest = await BottomSheetUtils.showMaterial(
    context: context,
    isScrollControlled: false,
    child: SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: key,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Đổi mật khẩu",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColorScheme.inkDark,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputDefault(
                    controller: oldPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Vui lòng nhập mật khẩu cũ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      hintText: "Nhập mật khẩu cũ",
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Vui lòng nhập mật khẩu mới";
                      }
                      if (value == oldPasswordController.text) {
                        return "Mật khẩu mới không được trùng mật khẩu cũ";
                      }
                      return null;
                    },
                    controller: newpasswordController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      hintText: "Nhập mật mới",
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Vui lòng nhập lại mật khẩu mới";
                      }
                      if (value != newpasswordController.text) {
                        return "Mật khẩu nhập lại không trùng khớp";
                      }
                      return null;
                    },
                    controller: confirmpasswordController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      hintText: "Nhập lại mật khẩu mới",
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
                title: "Cập nhật",
                onTap: () {
                  if (key.currentState!.validate()) {
                    Navigator.pop(
                      context,
                      ChangePasswordReq(
                        oldPassword: oldPasswordController.text,
                        newPassword: newpasswordController.text,
                      ),
                    );
                  }
                  Navigator.pop(context, null);
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
  return formRequest ?? ChangePasswordReq(oldPassword: "", newPassword: "");
}
