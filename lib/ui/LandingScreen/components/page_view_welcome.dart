import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:workmanager_example/indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewWelcome extends StatefulWidget {
  const PageViewWelcome({Key? key}) : super(key: key);

  @override
  State<PageViewWelcome> createState() => _PageViewWelcomeState();
}

class _PageViewWelcomeState extends State<PageViewWelcome> {
  bool eventCheck = false;
  late List<Widget> items;
  var _selectedIndex = 0;
  int _currentPage = 0;
  late Timer _timer;
  final PageController _pageController = PageController(
    //viewportFraction: 0.9,
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    items = [
      itemPageView(
        "Tiết kiệm tối đa\n thời gian thao tác hằng ngày",
      ),
      itemPageView(
        "Điều khiển nâng cao\n có gì mới?",
      ),
      itemPageView(
        "Chỉ với một thao tác?\n",
      ),
      itemPageView(
        "Ứng dụng tuyệt vời \ncủa mọi gia đình",
      ),
    ];
    _timer = Timer.periodic(const Duration(milliseconds: 4000), (Timer timer) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 150,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              controller: _pageController,
              itemBuilder: (context, index) {
                return items[index % items.length];
              },
            )),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int index = 0; index < items.length; index++)
              IndicatorSignIn(
                isActive: _selectedIndex % items.length == index ? true : false,
              )
          ],
        ),
      ],
    );
  }

  Widget itemPageView(String title1) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AutoSizeText(
          title1,
          //"Chào mừng đến với\n hệ thống Leader", //AppText.welcomeTo,
          textAlign: TextAlign.center,
          maxLines: 4,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 32,
          ),
        ),
      ],
    );
  }
}
