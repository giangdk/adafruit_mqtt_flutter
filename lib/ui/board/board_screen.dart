import 'dart:async';

import 'package:workmanager_example/const.dart';
import 'package:workmanager_example/constant.dart';

import 'package:workmanager_example/ui/board/cubit/broad_cubit.dart';
import 'package:workmanager_example/ui/board/cubit/broad_state.dart';
import 'package:workmanager_example/ui/board/demo_screen.dart';
import 'package:workmanager_example/ui/connect_host/connect_host.dart';
import 'package:workmanager_example/ui/edit_board/edit_board_screen.dart';
import 'package:workmanager_example/ui/theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:path/path.dart' as p;

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<XFile> imageFileList = [];
  Timer? _timer;
  int _timerTotalSeconds = 0;

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
    // Timer(Duration(seconds: 5), () {
    //   nextScreen();
    // });

    // _connectToServer();
  }

  void init() {
    // concectBroker(disconnect: () {}, connect: () {});
  }

  void nextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DemoScreen()),
    );
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // client.disconnect();
    super.dispose();
  }

  Future<void> _connectToServer() async {
    await concectBroker(disconnect: () {}, connect: () {});
  }
  // Future<void> _connectToServer() async {
  //   const config = FlutterBackgroundAndroidConfig(
  //     notificationTitle: 'flutter_background example app',
  //     notificationText:
  //         'Background notification for keeping the example app running in the background',
  //     notificationIcon: AndroidResource(name: 'background_icon'),
  //     notificationImportance: AndroidNotificationImportance.Default,
  //     enableWifiLock: true,
  //     showBadge: true,
  //   );

  //   var hasPermissions = await FlutterBackground.hasPermissions;
  //   if (!hasPermissions) {
  //     // ignore: use_build_context_synchronously
  //     await showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //               title: const Text('Permissions needed'),
  //               content: const Text(
  //                   'Shortly the OS will ask you for permission to execute this app in the background. This is required in order to receive chat messages when the app is not in the foreground.'),
  //               actions: [
  //                 TextButton(
  //                   onPressed: () => Navigator.pop(context, 'OK'),
  //                   child: const Text('OK'),
  //                 ),
  //               ]);
  //         });
  //   }

  //   hasPermissions = await FlutterBackground.initialize(androidConfig: config);

  //   if (hasPermissions) {
  //     if (hasPermissions) {
  //       final backgroundExecution =
  //           await FlutterBackground.enableBackgroundExecution();
  //       if (backgroundExecution) {
  //         _timer = Timer(Duration(seconds: 15), () {
  //           print("giang");
  //         });
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BroadCubit()..init(),
      child: BlocConsumer<BroadCubit, BroadState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: kBgColor,
              appBar: _appBar(context),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.listBoardLocal.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    child: ItemBoard(
                                      context: context,
                                      state: state,
                                      index: index,
                                    ),
                                  );
                                }),
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

  AppBar _appBar(
    BuildContext context,
  ) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Color(0xffEFF2F7),
      elevation: 0,
      title: Text(
        "Schedule",
        style: headerTitleStyle.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 23,
        ),
        //style: subTitleStyle.copyWith(),
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditBoardScreen()),
            ).then((value) {
              context.read<BroadCubit>().init();
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            width: 50,
            height: 50,
            // decoration:
            //     BoxDecoration(shape: BoxShape.circle, color: primaryColor),
            child: const Icon(
              Icons.add,
              size: 38,
              color: primaryColor, //Colors.amber[600],
            ),
          ),
        )
      ],
    );
  }

  Widget ItemBoard({
    required int index,
    required BroadState state,
    required BuildContext context,
    // required String title,
    // required DateTime time,
    // Function()? onPress,
    // List<Uint8List>? image,
  }) {
    IconData icon = Icons.highlight_outlined;

    switch (state.listBoardLocal[index].model) {
      case "Đèn":
        icon = Icons.highlight_outlined;
        break;
      case "Quạt":
        icon = Icons.wind_power;
        break;
      case "Cửa sổ":
        icon = Icons.window_outlined;
        break;
    }
    String statusModel = state.listBoardLocal[index].statusModel!;
    if (state.listBoardLocal[index].model == "Cửa sổ" &&
        state.listBoardLocal[index].statusModel! == "Tắt") {
      statusModel = "Đóng";
    }
    bool isEnable = state.listBoardLocal[index].isEnable ?? true;
    int duration = state.listBoardLocal[index].timeDuration!;
    int hour = (duration / 60).toInt();
    int minute = duration % 60;
    var textTime =
        "${hour > 9 ? hour.toString() : "0${hour.toString()}"}:${minute > 9 ? minute.toString() : "0${minute.toString()}"}";
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditBoardScreen(
                          boardModelLocal: state.listBoardLocal[index])),
                ).then((value) {
                  context.read<BroadCubit>().init();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: (isEnable == true ? kOrangeColor : Colors.white),
                    boxShadow: [
                      BoxShadow(
                        color: isEnable == true
                            ? kOrangeColor.withOpacity(0.5)
                            : Colors.grey.shade200,
                        blurRadius: 30,
                        offset: Offset(5, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(14),
                margin: EdgeInsets.only(right: 12, left: 12),
                child: Row(
                  children: [
                    Container(
                      height: 54,
                      width: 54,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isEnable ? secondaryColor : Color(0xffDADADA),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icon,
                        color: isEnable ? Color(0xff199089) : Colors.grey,
                        size: 32,
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 12,
                        ),
                        Container(
                          //height: 12,
                          child: Text(
                            ("${statusModel} ${state.listBoardLocal[index].model!}")
                                .toLowerCase(),
                            style: subTitleStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: isEnable
                                    ? Color(0xffffc386)
                                    : Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          //margin: EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            children: [
                              Text(
                                textTime,
                                style: subTitleStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                    color: isEnable
                                        ? Color(0xffffc386)
                                        : greyPrymaryColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(child: Container()),
                    Container(
                      child: FlutterSwitch(
                        activeColor: Color(0xff199089),
                        inactiveColor: Color(0xffD6D6D6),
                        activeToggleColor: Color(0xffffc386),
                        width: 62,
                        height: 33,
                        valueFontSize: 0,
                        toggleSize: 20.0,
                        value: state.listBoardLocal[index].isEnable ?? true,
                        borderRadius: 30.0,
                        padding: 6.0,
                        showOnOff: true,
                        onToggle: (val) {
                          context
                              .read<BroadCubit>()
                              .setStatus(state.listBoardLocal[index]);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String countDay(DateTime time) {
    int timeIn = time.millisecondsSinceEpoch;
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now > timeIn + (1000 * 60 * 60 * 24)) {
      double day = (now - timeIn) / ((1000 * 60 * 60 * 24));
      return (day.toInt()).toString() + " Ngày";
    } else {
      return "";
    }
  }

  Widget imageItem() {
    ImagePicker picker = ImagePicker();
    XFile? image;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Container(),
      ),
    );
  }
}
