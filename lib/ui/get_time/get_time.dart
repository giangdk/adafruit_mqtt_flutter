import 'package:workmanager_example/const.dart';
import 'package:workmanager_example/extension/date_formatting.dart';
import 'package:workmanager_example/ui/LandingScreen/components/default_button.dart';
import 'package:workmanager_example/widget/text_form_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class GetTime extends StatefulWidget {
  const GetTime({Key? key}) : super(key: key);

  @override
  State<GetTime> createState() => _GetTimeState();
}

class _GetTimeState extends State<GetTime> {
  late DateTime? startDate;
  late DateTime? endDate;

  final List<int> hour = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23
  ];
  final List<int> minute = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59
  ];
  late String selectedValueHour = "0";
  late String selectedValueMinute = "0";
  late TextEditingController hourDateController = TextEditingController();
  late TextEditingController minuteDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chọn giờ bật tắt tự động',
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        //padding:  EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            iconSize: 0.0,
                            items: hour
                                .map((item) => DropdownMenuItem<String>(
                                      value: item.toString(),
                                      child: Text(item.toString()),
                                    ))
                                .toList(),
                            onChanged: (item) {
                              setState(() {
                                selectedValueHour = item.toString();
                              });
                            },
                            value: selectedValueHour,
                          ),
                        ),
                      ),
                      const Text(
                        " : ",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        //padding:  EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            iconSize: 0.0,
                            items: minute
                                .map((item) => DropdownMenuItem<String>(
                                      value: item.toString(),
                                      child: Text(item.toString()),
                                    ))
                                .toList(),
                            onChanged: (item) {
                              setState(() {
                                selectedValueMinute = item.toString();
                              });
                            },
                            value: selectedValueMinute,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultButton(
                size: size,
                title: "Xác nhận ",
                press: () {
                  Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const ForgotPasswordScreen()),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
