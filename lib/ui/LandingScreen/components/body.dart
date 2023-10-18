import 'package:workmanager_example/const.dart';
import 'package:workmanager_example/ui/LandingScreen/components/control_button.dart';
import 'package:workmanager_example/ui/LandingScreen/components/page_view_welcome.dart';
import 'package:workmanager_example/ui/connect_host/connect_host.dart';
import 'package:workmanager_example/ui/get_time/get_time.dart';
import 'package:workmanager_example/ui/sensorScreen/widget/custome_cupertino_alert.dart';
import 'package:flutter/material.dart';

class LandingScreenBody extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LandingScreenBodyState createState() => _LandingScreenBodyState();
}

class _LandingScreenBodyState extends State<LandingScreenBody> {
  @override
  void initState() {
    super.initState();
  }

  late bool isActiveLed = false;
  late bool isActiveWindow = false;
  late bool isActiveFan = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nâng cao',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        leading: InkWell(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 24,
            color: kDarkGreyColor,
          ),
        ),
        backgroundColor: kBgColor,
        elevation: 0,
      ),
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 30),
              const PageViewWelcome(),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ControlButton(
                    size: size,
                    title: 'Bật tắt đèn\ntheo ánh sáng',
                    icon: Icons.highlight_outlined,
                    isSelected: isActiveLed,
                    onTap: () {
                      if (isActiveLed == false) {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext dialogContext) {
                            return CustomCupertinoAlert(
                              context: context,
                              title: "Thông báo",
                              content: 'Đèn sẽ tự động bặt tắt theo ánh sáng',
                              rightButtonTitle: 'Xác nhận',
                              rightAction: () async {
                                pushMess("afan", "1");
                                setState(() {
                                  isActiveLed = !isActiveLed;
                                });

                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      } else {
                        pushMess("afan", "0");
                        setState(() {
                          isActiveLed = false;
                        });
                      }
                      // if(isActiveLed){
                      //   pushMess("toppic", mess)
                      // }
                    },
                  ),
                  ControlButton(
                    size: size,
                    title: 'Tắt đèn \ntự động ',
                    icon: Icons.lightbulb_outline,
                    disapble: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GetTime()),
                      );
                    },
                  ),
                  ControlButton(
                    size: size,
                    disapble: true,
                    title: 'Bật đèn \ntự động',
                    icon: Icons.highlight,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GetTime()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ControlButton(
                    size: size,
                    title: 'Đóng cửa \nkhi trời mưa',
                    icon: Icons.window_outlined,
                    onTap: () {
                      if (isActiveWindow == false) {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext dialogContext) {
                            return CustomCupertinoAlert(
                              context: context,
                              title: "Thông báo",
                              content: 'Cửa sẽ tự động đóng khi trời mưa',
                              rightButtonTitle: 'Xác nhận',
                              rightAction: () async {
                                pushMess("adoor", "1");
                                setState(() {
                                  isActiveWindow = !isActiveWindow;
                                });

                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      } else {
                        pushMess("adoor", "0");
                        setState(() {
                          isActiveWindow = false;
                        });
                      }
                    },
                    isSelected: isActiveWindow,
                  ),
                  ControlButton(
                    size: size,
                    title: 'Hẹn giờ\nđóng cửa',
                    icon: Icons.sensor_window_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GetTime()),
                      );
                    },
                    disapble: true,
                  ),
                  ControlButton(
                    size: size,
                    disapble: true,
                    title: 'Hẹn giờ\nmở cửa',
                    icon: Icons.sensor_window_rounded,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GetTime()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ControlButton(
                    size: size,
                    title: 'Bật tắt theo\nnhiệt độ',
                    icon: Icons.wind_power,
                    onTap: () {
                      if (isActiveFan == false) {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext dialogContext) {
                            return CustomCupertinoAlert(
                              context: context,
                              title: "Thông báo",
                              content: 'Quạt sẽ tự động bặt tắt theo nhiệt độ',
                              rightButtonTitle: 'Xác nhận',
                              rightAction: () async {
                                pushMess("afan", "1");
                                setState(() {
                                  isActiveFan = !isActiveFan;
                                });

                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      } else {
                        pushMess("afan", "0");
                        setState(() {
                          isActiveFan = false;
                        });
                      }
                    },
                    isSelected: isActiveFan,
                  ),
                  ControlButton(
                    size: size,
                    title: 'Hẹn giờ\nbật',
                    icon: Icons.wind_power_rounded,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GetTime()),
                      );
                    },
                    disapble: true,
                  ),
                  ControlButton(
                    size: size,
                    title: 'Hẹn giờ\ntắt',
                    icon: Icons.wind_power_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GetTime()),
                      );
                    },
                    disapble: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
