// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/app/feature/login/presentation/page/login_page.dart';
import 'package:food_delivery/common/btn/btn_default.dart';
import 'package:food_delivery/common/input/input_default.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_delivery/app/feature/auth/data/models/user_response.dart';
import 'package:food_delivery/app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:intl/intl.dart';
import '../../../../../common/utils/bottom_sheet_utils.dart';
import '../../../auth/data/models/logout_request.dart';
import '../widgets/item_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = "/profile";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker picker = ImagePicker();
  File? image;

  Future<void> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      //chuyển image thành base64
      // final bytes = await imageTemporary.readAsBytes();
      // final base64String = base64Encode(bytes);
      // //update profile
      // final UserProfile updatedProfile =
      //     userProfile.copyWith(avatarBase64: base64String);
      // UserProfileManager.updateProfile(updatedProfile);

      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is GetDoneUserState) {
          // final user = state.user;
          // userReq = UpdateProfileReq(
          //     phone: user.phone,
          //     email: user.email,
          //     fullName: user.fullName,
          //     dateOfBirth: user.dateOfBirth,
          //     address: user.address,
          //     gender: user.gender);
        }

        if (state is AuthLogOutState) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
        }
      },
      builder: (context, state) {
        if (state is GetDoneUserState) {
          final UserResponseData userResponseData = state.user;
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Thông tin tài khoản",
                style: TextStyle(color: AppColorScheme.inkDark),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColorScheme.inkDark,
                ),
              ),
              elevation: 0,
              backgroundColor: AppColorScheme.white,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: 140,
                              width: 140,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  image != null
                                      ? CircleAvatar(
                                          backgroundImage: image != null
                                              ? Image.file(image!).image
                                              : NetworkImage(
                                                  userResponseData?.avatar ??
                                                      ""),
                                        )
                                      : CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              userResponseData?.avatar ?? ""),
                                        ),
                                  // MemoryImage(profile.avatar),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Center(
                                      child: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: GestureDetector(
                                          onTap: () {
                                            pickImage();
                                            print("OK");
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xfff5f6f9),
                                                border: Border.all(
                                                    color:
                                                        AppColorScheme.inkGray,
                                                    width: 1),
                                              ),
                                              child: SvgPicture.asset(
                                                  Assets.images.cameraIcon)),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: const [
                            Text("Thông tin mặc định",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColorScheme.inkDark,
                                    fontSize: 15)),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        ItemProfile(
                          attribute: "Số điện thoại",
                          value: userResponseData.phone,
                          onTap: () {
                            update(
                                    title: "số điện thoại",
                                    context: context,
                                    name: userResponseData.phone)
                                .then((value) {
                              if (value != userResponseData.phone) {
                                // context.read<AuthCubit>().updatePhone(value);
                              }
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ItemProfile(
                          attribute: "Địa chỉ email",
                          value: userResponseData.email,
                          onTap: () {
                            update(
                                    title: "email",
                                    context: context,
                                    name: userResponseData.email)
                                .then((value) {
                              if (value != userResponseData.email) {
                                // context.read<AuthCubit>().updateEmail(value);
                              }
                            });
                          },
                        ),
                        const Divider(),
                        Row(
                          children: const [
                            Text("Thông tin thay đổi",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColorScheme.inkDark,
                                    fontSize: 15))
                          ],
                        ),
                        ItemProfile(
                          attribute: "Tên",
                          value: userResponseData.fullName,
                          onTap: () {
                            update(
                                    title: "tên",
                                    context: context,
                                    name: userResponseData.fullName)
                                .then((value) async {
                              if (value != userResponseData.fullName) {
                                context.read<AuthCubit>().updateFullName(value);
                              }
                            });
                          },
                        ),
                        ItemProfile(
                          attribute: "Giới tính",
                          value:
                              userResponseData.gender == "MALE" ? "Nam" : "Nữ",
                          onTap: () {},
                        ),
                        ItemProfile(
                          attribute: "Ngày Sinh",
                          value: DateFormat.yMMMMd()
                              .format(userResponseData.dateOfBirth),
                          onTap: () {},
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: AppColorScheme.kPrimary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Đổi mật khẩu",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColorScheme.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<AuthCubit>().doLogOut(
                                LogoutRequest(accessToken: state.accessToken));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              color: AppColorScheme.inkWhite,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: AppColorScheme.kPrimary, width: 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Đăng Xuất",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColorScheme.kPrimary),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

Future<String> update({
  required BuildContext context,
  required String title,
  required String name,
}) async {
  TextEditingController txtName = TextEditingController(text: name);
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
                    hintText: "Nhập tên",
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
              ],
            ),
            BtnDefault(
              title: "Cập nhật",
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
