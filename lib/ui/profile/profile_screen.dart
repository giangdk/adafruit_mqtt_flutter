import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager_example/constant.dart';
import 'package:workmanager_example/data/cache_manager.dart';
import 'package:workmanager_example/ui/auth.dart';
import 'package:workmanager_example/ui/profile/cubit/profile_cubit.dart';
import 'package:workmanager_example/ui/profile/cubit/profile_state.dart';
import 'package:workmanager_example/ui/profile/widget/divider_widget.dart';
import 'package:workmanager_example/ui/profile/widget/header.dart';
import 'package:workmanager_example/ui/profile/widget/item_profile.dart';
import 'package:workmanager_example/ui/profile/widget/pick_color.dart';
import 'package:workmanager_example/ui/signin/widget_tree.dart';
import 'package:workmanager_example/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _cacheManager = CacheManager.instance;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..init(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: secondaryColor75,
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Header(
                              title: "Cài đặt ",
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              margin: EdgeInsets.symmetric(horizontal: 14),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Container(
                                    //height: 46,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Xin chào!",
                                      style: subHeadingStyle.copyWith(
                                          color: const Color(0xff2C3F55)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  state.userLocal != null
                                      ? Container(
                                          //height: 46,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            state.userLocal!.name,
                                            style: subHeadingStyle.copyWith(
                                                color: const Color(0xff2C3F55),
                                                fontSize: 17),
                                          ),
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: 18,
                                  ),
                                ],
                              ),
                            ),
                            const DividerWidget(),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              margin: EdgeInsets.symmetric(horizontal: 14),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                children: [
                                  ItemProfile(
                                    onPress: () {
                                      context
                                          .read<ProfileCubit>()
                                          .writeEvaluate();
                                    },
                                    title: 'Viết đánh giá',
                                  ),
                                  ItemProfile(
                                    onPress: () {
                                      context.read<ProfileCubit>().shareApp();
                                    },
                                    title: 'Chia sẻ ứng dụng',
                                  ),
                                  ItemProfile(
                                    onPress: () {
                                      context.read<ProfileCubit>().contactUs();
                                    },
                                    title: 'Liên hệ với chúng tôi ',
                                  ),
                                ],
                              ),
                            ),
                            const DividerWidget(),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              margin: EdgeInsets.symmetric(horizontal: 14),
                              decoration: BoxDecoration(
                                  color: Colors.red[100],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                children: [
                                  ItemProfile(
                                    colortext: Colors.grey[800],
                                    onPress: () async {
                                      await _cacheManager.addUserToCached(null);
                                      // Obtain shared preferences.
                                      final SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      List<String> account =
                                          await prefs.getStringList(
                                                'accounts',
                                              ) ??
                                              [];
                                      account.add(state.userLocal!.name);
                                      print(account.toString());
                                      await prefs.setStringList(
                                          'accounts', account);
                                      Fluttertoast.showToast(
                                          msg: "Xoá tài khoản thành công");
                                      setState(() {
                                        Auth().signOut();
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const WidgetTree()),
                                        );
                                      });
                                    },
                                    title: 'Xoá tài khoản',
                                  ),
                                ],
                              ),
                            ),
                            const DividerWidget(),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              margin: EdgeInsets.symmetric(horizontal: 14),
                              decoration: BoxDecoration(
                                  color: Colors.red[200],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                children: [
                                  ItemProfile(
                                    colortext: Colors.white,
                                    onPress: () async {
                                      await _cacheManager.addUserToCached(null);
                                      setState(() {
                                        Auth().signOut();
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const WidgetTree()),
                                        );
                                      });
                                    },
                                    title: 'Đăng xuất',
                                  ),
                                ],
                              ),
                            ),
                            const DividerWidget(),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "Phiên bản 1.1.0",
                                style: subTitleStyle.copyWith(
                                    color: greyPrymaryColor, fontSize: 13),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }

  void showToast({String mess = "Tính năng đang cập nhật"}) {
    Fluttertoast.showToast(msg: mess);
  }
}
