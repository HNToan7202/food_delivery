import 'package:flutter/material.dart';
import 'package:food_delivery/app/feature/welcome/presentation/page/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../common/btn/btn_default.dart';
import '../../../../../common/color_extension.dart';
import '../../../../../common/text_theme.dart';
import '../../../../../gen/assets.gen.dart';
import '../../data/model/intro_data.dart';
import '../widgets/intro_content.dart';

class IntroBody extends StatefulWidget {
  const IntroBody({Key? key}) : super(key: key);

  @override
  State<IntroBody> createState() => _IntroBodyState();
}

class _IntroBodyState extends State<IntroBody> {
  static const kAnimationDuration = Duration(milliseconds: 200);
  int currentPage = 0;
  List<IntroData> splashData = [];
  late PageController _pageController;

  @override
  void initState() {
    initIntroData();
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnBoardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', false);
  }

  bool isLastPage() {
    return currentPage == splashData.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        Positioned(
            top: 16,
            right: 16,
            child: TextButton(
              onPressed: () {
                _storeOnBoardInfo();
                Navigator.pushNamed(context, WelComePage.routeName,
                    arguments: "");
              },
              child: Text(
                "Skip",
                style: tStyle.PrM(color: AppColorScheme.inkDarkGray),
              ),
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 144,
              ),
              Expanded(
                flex: 2,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) => IntroContent(
                    text: splashData[currentPage].content,
                    image: splashData[currentPage].image,
                    heading: splashData[currentPage].header,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    BtnDefault(
                      title: splashData[currentPage]
                          .buttonTitle, // Dynamically set the button text
                      decoration: BoxDecoration(
                        color: AppColorScheme.light.primary,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      onTap: () {
                        if (currentPage < splashData.length - 1) {
                          setState(() {
                            currentPage++; // Tăng currentPage để chuyển đến trang intro tiếp theo
                          });
                        } else {
                          _storeOnBoardInfo();
                          Navigator.pushNamed(context, WelComePage.routeName,
                              arguments:
                                  ""); // Nếu đã ở trang cuối cùng, chuyển đến trang đăng nhập
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  void initIntroData() async {
    IntroData intro1 = IntroData(
        header: "Learn anytime \n and anywhere",
        content:
            "Quarantine is the perfect time to spend your day learning something new, from anywhere!",
        buttonTitle: "Next",
        image: Assets.images.onBoarding1.path);

    IntroData intro2 = IntroData(
        header: "Find a course \nfor you",
        content:
            "Quarantine is the perfect time to spend your day learning something new, from anywhere!",
        buttonTitle: "Next",
        image: Assets.images.onBoarding2.path);

    IntroData intro3 = IntroData(
        header: "Learn anytime \n and anywhere",
        content:
            "Quarantine is the perfect time to spend your day learning something new, from anywhere!",
        buttonTitle: "Let's Start",
        image: Assets.images.onBoarding3.path);

    splashData.add(intro1);
    splashData.add(intro2);
    splashData.add(intro3);
  }

  AnimatedContainer buildDot({int index = 0}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      height: 6,
      width: currentPage == index ? 20 : 6,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: currentPage == index
            ? AppColorScheme.light.primary
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
