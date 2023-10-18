import 'package:workmanager_example/constant.dart';
import 'package:workmanager_example/ui/primary_button.dart';
import 'package:workmanager_example/ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<void> showPickerModalPopup(
    {required BuildContext context, List<Color>? listColor}) {
  List<Color> colors = [
    const Color(0xffE1E628),
    const Color(0xffB7BF1E),
    const Color(0xffF5BB2C),
    const Color(0xffF2A201),
    const Color(0xff78D78A),
    const Color(0xff54D6BE),
    const Color(0xff7597EF),
    const Color(0xffA259CF),
    const Color(0xffBD5297),
    const Color(0xffF65B59),
    const Color(0xff40A3C3),
    const Color(0xffE494D9),
  ];
  return showBarModalBottomSheet(
    context: context,
    //expand: true,
    builder: (BuildContext context1) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 12),
        height: 320,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 50,
              child: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                elevation: 0,
                actions: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 18),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_sharp,
                        size: 24,
                        color: greyPrymaryColor,
                      ),
                    ),
                  )
                ],
                title: Text(
                  "Chọn màu săc",
                  style: titleStyle.copyWith(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: greyPrymaryColor,
            ),
            Container(
                height: 200,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 3 / 3,
                    mainAxisSpacing: kDefaultPaddingScreen,
                    crossAxisSpacing: kDefaultPaddingScreen,
                  ),
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: colors[index], shape: BoxShape.circle),
                    );
                  },
                )),
            PrimaryButton(
              label: "Xong",
              borderRadius: BorderRadius.circular(12),
              onPressed: () {
                Navigator.pop(context);
              },
              style: titleStyle.copyWith(fontSize: 15, color: Colors.white),
            ),
            SizedBox(
              height: 12,
            )
          ],
        ),
      );
    },
  );
}
