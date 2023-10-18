import 'dart:async';

import 'package:workmanager_example/data/cache_manager.dart';
import 'package:workmanager_example/data/model/user_local/user_model_local.dart';
import 'package:workmanager_example/extension/date_formatting.dart';
import 'package:workmanager_example/ui/LandingScreen/components/control_button.dart';
import 'package:workmanager_example/ui/connect_host/connect_host.dart';
import 'package:workmanager_example/ui/sensorScreen/widget/card.dart';
import 'package:workmanager_example/ui/sensorScreen/widget/custome_cupertino_alert.dart';
import 'package:workmanager_example/ui/sensorScreen/widget/status_button.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';

class SensorScreenBody extends StatefulWidget {
  @override
  _SensorScreenBodyState createState() => _SensorScreenBodyState();
}

bool connectServer = false;

class _SensorScreenBodyState extends State<SensorScreenBody> with TickerProviderStateMixin {
  late DateTime timeNow = DateTime.now();
  late bool connect = false;
  late bool isActiveFan = false;
  late bool isActiveLed = false;
  late bool isActiveLed1 = false;
  late bool isActiveWindown = false;

  late bool isActiveLedAT = false;
  late bool isActiveWindowAT = false;
  late bool isActiveFanAT = false;

  String doam = "0";
  String nhietdo = "0";
  late Timer? _timer = null;
  String messageTitle = "Empty";
  String notificationAlert = "alert";
  late TabController tabController;
  final CacheManager _cacheManager = CacheManager.instance;
  late UserLocal? userLocal = null;
  //FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // final controller = Get.put(Appcontroller(connect: "false".obs));
  bool checkClose = false;
  late Timer? timerBig = null;
  @override
  void initState() {
    if (connectServer == false) {
      init();
    }
    tabController = TabController(length: 2, vsync: this);
    //
    // timerBig = Timer(Duration(seconds: 5), () {
    //   print("maiducgiang delay" + doam + " " + nhietdo);
    //   String doamget = '0';
    //   String nhietdoget = '0';
    //   if (connect == true) {
    //     client?.updates?.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
    //       print("maiducgiang delay" + c.toString());
    //       for (int i = 0; i < c!.length; i++) {
    //         final recMess = c[i].payload as MqttPublishMessage;
    //         final pt = MqttPublishPayload.bytesToStringAsString(
    //             recMess.payload.message);
    //         // setState(() {
    //         if (c[i].topic == "HUMI") doamget = pt;
    //         if (c[i].topic == "TEMP") nhietdoget = pt;
    //         // });
    //       }
    //     });
    //     _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
    //       setState(() {
    //         doam = doamget;
    //         nhietdo = nhietdoget;
    //       });
    //     });
    //   }
    // });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SensorScreenBody oldWidget) {
    // TODO: implement didUpdateWidget

    super.didUpdateWidget(oldWidget);
  }

  void init() async {
    // setState(() async {
    userLocal = await _cacheManager.getUserCached();
    // });
    // concectBroker(disconnect: () {
    //   setState(() {
    //     connect = false;
    //   });
    // }, connect: () {
    //   setState(() {
    //     connect = true;
    //     connectServer = true;
    //   });
    // });
  }

  @override
  void dispose() {
    // TODO: implement disposes

    print("dispose");
    // client.disconnect();
    if (_timer != null) {
      _timer?.cancel();
    }
    if (timerBig != null) {
      timerBig?.cancel();
    }

    super.dispose();
  }

  void disconect() {
    // client.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // InkWell(
                  //   onTap: () async {
                  //     await _cacheManager.addUserToCached(null);
                  //     setState(() {
                  //       Auth().signOut();
                  //       Navigator.pushReplacement(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const WidgetTree()),
                  //       );
                  //     });
                  //   },
                  //   child: const Icon(
                  //     Icons.menu,
                  //     size: 30,
                  //     color: kDarkGreyColor,
                  //   ),
                  // ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  // Container(
                  //   height: size.height * 0.045,
                  //   width: size.width * 0.095,
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey.shade50,
                  //     borderRadius: BorderRadius.circular(30),
                  //     boxShadow: const [
                  //       BoxShadow(
                  //         color: Colors.black12,
                  //         blurRadius: 8,
                  //         offset: Offset(3, 3),
                  //       ),
                  //     ],
                  //   ),
                  //   child: const Icon(
                  //     Icons.notifications_none,
                  //     color: kDarkGreyColor,
                  //   ),
                  // )
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/avatar.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        //'JUNE 14, 2020',
                        timeNow.toEEEMMMdY(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Xin chào!\n${userLocal != null ? userLocal!.name.split("@")[0] : "Giang"}',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$nhietdo°",
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          'TEMPERATURE',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$doam%',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          'HUMIDITY',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        connect = false;
                        disconect();
                      });
                    },
                    child: StatusButton2(
                      size: MediaQuery.of(context).size,
                      isActive: connect,
                    ),
                  ),
                  CustomCard(
                    size: size,
                    icon: Icon(
                      Icons.home_outlined,
                      size: 55,
                      color: Colors.grey.shade400,
                    ),
                    title: "ENTRY",
                    statusOn: "Connected",
                    statusOff: "Disconected",
                    connected: () async {
                      setState(() {
                        connect = true;
                      });
                      concectBroker(
                          disconnect: () {
                            // setState(() {
                            //   connect = false;
                            // });
                          },
                          connect: () {});
                      try {
                        if ((_timer == null || _timer?.isActive == false)) {
                          print("giang");
                          timerBig = Timer(Duration(seconds: 5), () {
                            print("maiducgiang delay" + doam + " " + nhietdo);
                            String doamget = '0';
                            String nhietdoget = '0';
                            if (connect == true) {
                              client?.updates?.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
                                print("maiducgiang delay" + c.toString());
                                for (int i = 0; i < c!.length; i++) {
                                  final recMess = c[i].payload as MqttPublishMessage;
                                  final pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
                                  // setState(() {
                                  if (c[i].topic == "Maiducgiang01/feeds/humi") doamget = pt;
                                  if (c[i].topic == "Maiducgiang01/feeds/temp") nhietdoget = pt;
                                  // });
                                }
                              });
                              _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
                                setState(() {
                                  doam = doamget;
                                  nhietdo = nhietdoget;
                                });
                              });
                            }
                          });
                        }
                      } catch (e) {
                        print("error giang" + e.toString());
                      }
                    },
                    disconect: () async {},
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05),
              TabBar(
                controller: tabController,
                isScrollable: true,
                unselectedLabelColor: Colors.black45,
                labelPadding: EdgeInsets.symmetric(horizontal: 40),
                labelColor: Colors.grey,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  // insets: EdgeInsets.symmetric(horizontal: 48),
                ),
                tabs: const [
                  Tab(text: 'Thủ công'),
                  Tab(text: 'Tự động'),
                ],
              ),
              Container(
                height: 350,
                child: TabBarView(controller: tabController, children: [Manual(), Auto()]),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  Widget Manual() {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ControlButton(
              size: size,
              title: 'Điều khiển\nđèn 1',
              icon: Icons.highlight,
              isSelected: isActiveLed1,
              onTap: () {
                setState(() {
                  isActiveLed1 = !isActiveLed1;
                });
                if (isActiveLed1 == false) {
                  pushMess("led1", "0");
                } else {
                  pushMess("led1", "1");
                }
              },
            ),
            // ControlButton(
            //   size: size,
            //   title: 'Điều khiển \nnâng cao',
            //   icon: Icons.settings_outlined,
            //   isSelected: false,
            //   //disapble: true,
            //   onTap: () {
            //     if (connect == false) {
            //       showDialog<void>(
            //         context: context,
            //         barrierDismissible: false,
            //         builder: (BuildContext dialogContext) {
            //           return CustomCupertinoAlert(
            //             context: context,
            //             title: "Chú ý",
            //             content:
            //                 'Ứng dụng chưa được kết nối. Vui lòng thực hiện kết nối trước khi điều khiển nâng cao',
            //             rightButtonTitle: 'Xác nhận',
            //             rightAction: () async {
            //               Navigator.pop(context);
            //             },
            //           );
            //         },
            //       );
            //     } else {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => LandingScreen()),
            //       );
            //     }
            //   },
            // ),
            ControlButton(
              size: size,
              title: 'Điều khiển \nquạt ',
              icon: Icons.wind_power,
              isSelected: isActiveFan,
              onTap: () {
                setState(() {
                  isActiveFan = !isActiveFan;
                });
                if (isActiveFan == false) {
                  pushMess("fan", "0");
                } else {
                  pushMess("fan", "1");
                }
              },
            ),
            ControlButton(
              size: size,
              title: 'Điều khiển\nđèn 2',
              icon: Icons.highlight,
              isSelected: isActiveLed,
              onTap: () {
                setState(() {
                  isActiveLed = !isActiveLed;
                });
                if (isActiveLed == false) {
                  pushMess("led2", "0");
                } else {
                  pushMess("led2", "1");
                }
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
              title: 'Đóng mở \ncửa sổ',
              icon: Icons.window_outlined,
              isSelected: isActiveWindown,
              onTap: () {
                setState(() {
                  isActiveWindown = !isActiveWindown;
                });

                if (isActiveWindown == false) {
                  pushMess("door", "0");
                } else {
                  pushMess("door", "1");
                }
              },
            ),
            ControlButton(
              size: size,
              title: 'Nhiệt độ\n trong phòng ',
              icon: Icons.ac_unit,
              onTap: () {
                // Navigator.push(
                //   context,
                //   CupertinoPageRoute(
                //     builder: (context) => SensorScreen(),
                //   ),
                // );
              },
            ),
            ControlButton(
              size: size,
              title: 'Độ ẩm \ntrong phòng',
              icon: Icons.water_drop_outlined,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const GetTime()),
                // );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget Auto() {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          // SizedBox(height: size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ControlButton(
                size: size,
                title: 'Bật tắt đèn\ntheo ánh sáng',
                icon: Icons.highlight_outlined,
                isSelected: isActiveLedAT,
                onTap: () {
                  if (isActiveLedAT == false) {
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
                            pushMess("aled", "1");
                            setState(() {
                              isActiveLedAT = !isActiveLedAT;
                            });

                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  } else {
                    pushMess("aled", "0");
                    setState(() {
                      isActiveLedAT = false;
                    });
                  }
                  // if(isActiveLed){
                  //   pushMess("toppic", mess)
                  // }
                },
              ),
              ControlButton(
                size: size,
                title: 'Đóng cửa \nkhi trời mưa',
                icon: Icons.window_outlined,
                onTap: () {
                  if (isActiveWindowAT == false) {
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
                              isActiveWindowAT = !isActiveWindowAT;
                            });

                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  } else {
                    pushMess("adoor", "0");
                    setState(() {
                      isActiveWindowAT = false;
                    });
                  }
                },
                isSelected: isActiveWindowAT,
              ),
              ControlButton(
                size: size,
                title: 'Bật tắt theo\nnhiệt độ',
                icon: Icons.wind_power,
                onTap: () {
                  if (isActiveFanAT == false) {
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
                              isActiveFanAT = !isActiveFanAT;
                            });

                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  } else {
                    pushMess("afan", "0");
                    setState(() {
                      isActiveFanAT = false;
                    });
                  }
                },
                isSelected: isActiveFanAT,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
