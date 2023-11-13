import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/multiple_language/presentation/cubit/multiple_language_cubit.dart';
import 'package:food_delivery/common/btn/btn_default.dart';
import '../../../../../common/color_extension.dart';
import '../../../../../gen/assets.gen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MultiplePage extends StatefulWidget {
  const MultiplePage({super.key});

  @override
  State<MultiplePage> createState() => _MultiplePageState();
}

class _MultiplePageState extends State<MultiplePage> {
  int selectMethod = -1;
  List multipleArr = [
    {"name": "English", "icon": Assets.images.unitedKingdom.path, "code": "en"},
    {"name": "VietNamese", "icon": Assets.images.vietnam.path, "code": "vi"},
  ];

  void setCode() {
    var code = context.read<MultipleLanguageCubit>().currentLanguage;
    for (var i = 0; i < multipleArr.length; i++) {
      if (multipleArr[i]["code"] == code) {
        setState(() {
          selectMethod = i;
          oldSelect = i;
        });
        break;
      }
    }
  }

  bool isChange = false;
  int oldSelect = -1;

  @override
  void initState() {
    super.initState();
    setCode();
  }

  @override
  Widget build(BuildContext context) {
    isChange = oldSelect != selectMethod;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorScheme.kPrimary,
        title: Text(AppLocalizations.of(context)!.changeLanguage),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: multipleArr.length,
              itemBuilder: (context, index) {
                var pObj = multipleArr[index] as Map? ?? {};
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                      color: AppColorScheme.textfield,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color:
                              AppColorScheme.secondaryText.withOpacity(0.2))),
                  child: Row(
                    children: [
                      Image.asset(pObj["icon"].toString(),
                          width: 50, height: 20, fit: BoxFit.contain),
                      // const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          pObj["name"],
                          style: TextStyle(
                              color: AppColorScheme.primaryText,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectMethod = index;
                          });
                        },
                        child: Icon(
                          selectMethod == index
                              ? Icons.radio_button_on
                              : Icons.radio_button_off,
                          color: AppColorScheme.kPrimary,
                          size: 15,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            BtnDefault(
              title: AppLocalizations.of(context)!.save,
              decoration: BoxDecoration(
                  color: isChange == true
                      ? AppColorScheme.kPrimary
                      : AppColorScheme.inkGray,
                  borderRadius: BorderRadius.circular(5)),
              onTap: () {
                if (isChange) {
                  context.read<MultipleLanguageCubit>().changeLanguage(
                      multipleArr[selectMethod]["code"].toString());
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
