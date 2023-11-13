// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:food_delivery/app/feature/auth/data/models/user_response.dart';
import 'package:food_delivery/app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:food_delivery/app/feature/login/presentation/bloc/login_bloc.dart';
import 'package:food_delivery/app/feature/login/presentation/bloc/login_state.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker picker = ImagePicker();
  File? image;
  UserResponseData? userResponseData;

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
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                                                state.user?.avatar ?? ""),
                                      )
                                    : CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            state.user?.avatar ?? ""),
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
                                                  color: AppColorScheme.inkGray,
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
                        height: 20,
                      ),
                      ItemProfile(
                        attribute: "Tên",
                        value: state.user!.fullName,
                        onTap: () {},
                      ),
                      const Divider(),
                      ItemProfile(
                        attribute: "Số điện thoại",
                        value: state.user!.phone,
                        onTap: () {},
                      ),
                      const Divider(),
                      ItemProfile(
                        attribute: "Địa chỉ email",
                        value: state.user!.email,
                        onTap: () {},
                      ),
                      const Divider(),
                      ItemProfile(
                        attribute: "Giới tính",
                        value: state.user!.gender == "MALE" ? "Nam" : "Nữ",
                        onTap: () {},
                      ),
                      const Divider(),
                      ItemProfile(
                        attribute: "Ngày Sinh",
                        value:
                            DateFormat.yMMMMd().format(state.user!.dateOfBirth),
                        onTap: () {},
                      ),
                      const Divider(),
                      ItemProfile(
                        attribute: "Địa chỉ",
                        value: state.user!.address,
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

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
            IconButton(onPressed: onTap, icon: const Icon(Icons.edit_outlined))
          ],
        ),
      ],
    );
  }
}
