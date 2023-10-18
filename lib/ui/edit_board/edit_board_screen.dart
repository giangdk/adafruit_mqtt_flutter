import 'package:workmanager_example/constant.dart';
import 'package:workmanager_example/data/model/board_local/board_model.dart';
import 'package:workmanager_example/extension/date_formatting.dart';
import 'package:workmanager_example/ui/custome_textfield.dart';
import 'package:workmanager_example/ui/edit_board/cubit/edit_board_cubit.dart';
import 'package:workmanager_example/ui/edit_board/cubit/edit_board_state.dart';
import 'package:workmanager_example/ui/media_button_widget.dart';
import 'package:workmanager_example/ui/primary_button.dart';
import 'package:workmanager_example/ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:badges/badges.dart' as badges;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EditBoardScreen extends StatefulWidget {
  const EditBoardScreen({Key? key, this.boardModelLocal}) : super(key: key);
  final BoardModelLocal? boardModelLocal;
  @override
  State<EditBoardScreen> createState() => _EditBoardScreenState();
}

class _EditBoardScreenState extends State<EditBoardScreen> {
  late TextEditingController dayController = TextEditingController(
      text:
          "${DateTime.now().hour > 9 ? DateTime.now().hour.toString() : "0${DateTime.now().hour.toString()}"}:${DateTime.now().minute > 9 ? DateTime.now().minute.toString() : "0${DateTime.now().minute.toString()}"}");
  late bool init = false;
  final TextEditingController contentController = TextEditingController();
  late String selectedModel = "Đèn";
  late String selectedStatusModel = "Tắt";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditBoardCubit()..init(widget.boardModelLocal),
      child: BlocConsumer<EditBoardCubit, EditBoardState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state != null &&
              widget.boardModelLocal != null &&
              init == false) {
            selectedModel = widget.boardModelLocal!.model!;
            selectedStatusModel = widget.boardModelLocal!.statusModel!;
            contentController.text = state.title;
            int duration = widget.boardModelLocal!.timeDuration!;
            int hour = (duration / 60).toInt();
            int minute = duration % 60;
            var textTime =
                "${hour > 9 ? hour.toString() : "0${hour.toString()}"}:${minute > 9 ? minute.toString() : "0${minute.toString()}"}";

            dayController = TextEditingController(text: textTime);
            init = true;
          }
          return GestureDetector(
            onTap: () {
              unfocus(context);
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: _appBar(context, state),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // widgetListImage(context, state),

                      CustomeTextField(
                        title: 'Thời gian',
                        colorBorder: greyPrymaryColor,
                        controller: dayController,
                        prefixIcon: Container(
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            "assets/images/icons/calendar.svg",
                            color: greyPrymaryColor,
                            width: 16,
                          ),
                        ),
                        isEnable: false,
                        onTapPrefixIcon: () async {
                          // _selectTime(context);
                          showModalBottomSheet(
                            context: context,
                            // builder: (context2) => renderBottomSheet(
                            //     context, context2, state, state.startDatePick),
                            builder: (context2) => widgetCupertinoTimePicker(),
                            isScrollControlled: true,
                            enableDrag: true,
                          );
                          ;
                          // _dayPicker(state.day, state, context);
                        },
                      ),
                      // widgetCupertinoTimePicker(),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Thiết bị",
                          style: titleStyle,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 52,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.only(right: 8),
                                alignment: Alignment.center,
                                //padding:  EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    iconSize: 0.0,
                                    items: ["Đèn", "Quạt", "Cửa sổ"]
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item.toString(),
                                              child: Text(item.toString()),
                                            ))
                                        .toList(),
                                    onChanged: (item) {
                                      setState(() {
                                        selectedModel = item.toString();
                                      });
                                    },
                                    value: selectedModel,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.only(left: 8),
                                alignment: Alignment.center,
                                //padding:  EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    iconSize: 0.0,
                                    items: ["Tắt", "Mở", "Tự động"]
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item.toString(),
                                              child: Text(item.toString()),
                                            ))
                                        .toList(),
                                    onChanged: (item) {
                                      setState(() {
                                        selectedStatusModel = item.toString();
                                      });
                                    },
                                    value: selectedStatusModel,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 12,
                      ),
                      CustomeTextField(
                        title: 'Mô tả',
                        colorBorder: greyPrymaryColor,
                        controller: contentController,
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      PrimaryButton(
                        label: "Lưu",
                        onPressed: () {
                          context.read<EditBoardCubit>().save(
                              title: contentController.text,
                              time: state.day,
                              model: selectedModel,
                              timeDuration: initialTimerDuration,
                              statusModel: selectedStatusModel);
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              )),
            ),
          );
        },
      ),
    );
  }

  Duration initialTimerDuration =
      Duration(minutes: DateTime.now().minute, hours: DateTime.now().hour);
  Widget widgetCupertinoTimePicker() {
    return Container(
      height: 300,
      child: CupertinoTimerPicker(
        minuteInterval: 1,
        secondInterval: 1,
        initialTimerDuration: initialTimerDuration,
        mode: CupertinoTimerPickerMode.hm,
        onTimerDurationChanged: (Duration duration) {
          setState(() {
            initialTimerDuration = duration;
            setState(() {
              var hour = duration.inHours;
              var minute = duration.inMinutes % 60;
              dayController.text =
                  "${hour > 9 ? hour.toString() : "0${hour.toString()}"}:${minute > 9 ? minute.toString() : "0${minute.toString()}"}";
            });
          });
        },
      ),
    );
  }

  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      selectedTime.hour;
      setState(() {
        selectedTime = pickedTime;
        dayController.text =
            selectedTime.hour.toString() + ":" + selectedTime.minute.toString();
        dayController.text =
            "${selectedTime.hour > 9 ? selectedTime.hour.toString() : "0${selectedTime.hour.toString()}"}:${selectedTime.minute > 9 ? selectedTime.minute.toString() : "0${selectedTime.minute.toString()}"}";
      });
    }
  }

  AppBar _appBar(BuildContext context, EditBoardState state) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
      ),
      title: Text(
        widget.boardModelLocal == null ? "Thêm lịch" : "Sửa lịch",
        style: titleStyle.copyWith(
          fontSize: 23,
        ),
      ),
    );
  }

  Future<void> _showPickerModalPopup(BuildContext context) {
    return showBarModalBottomSheet(
      context: context,
      //expand: true,
      builder: (BuildContext context1) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          height: 100,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: kDefaultPaddingWidthScreen,
              ),
              MediaButtonWidget(
                  icon: Icons.photo,
                  title: 'Thêm hình ảnh',
                  onTap: () {
                    context
                        .read<EditBoardCubit>()
                        .handlePickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  }),
              SizedBox(
                width: kDefaultPaddingWidthScreen,
              ),
              MediaButtonWidget(
                  icon: Icons.camera_alt_rounded,
                  title: 'Chụp ảnh',
                  onTap: () {
                    context.read<EditBoardCubit>().getFromCamera();
                    Navigator.pop(context);
                  }),
              SizedBox(
                width: kDefaultPaddingWidthScreen,
              ),
            ],
          ),
        );
      },
    );
  }
}
