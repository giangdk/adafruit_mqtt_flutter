import 'package:auto_route/auto_route.dart';
import 'package:workmanager_example/constant.dart';
import 'package:workmanager_example/data/model/board_local/board_model.dart';
import 'package:workmanager_example/extension/date_formatting.dart';
import 'package:workmanager_example/ui/detail_board/cubit/detail_board_cubit.dart';
import 'package:workmanager_example/ui/detail_board/cubit/detail_board_state.dart';
import 'package:workmanager_example/ui/edit_board/edit_board_screen.dart';
import 'package:workmanager_example/ui/image/image_screen.dart';
import 'package:workmanager_example/ui/loading_screen.dart';
import 'package:workmanager_example/ui/router/router.gr.dart';
import 'package:workmanager_example/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailBoardScreen extends StatefulWidget {
  const DetailBoardScreen({Key? key, required this.boardModelLocal})
      : super(key: key);
  final BoardModelLocal boardModelLocal;
  @override
  State<DetailBoardScreen> createState() => _DetailBoardScreenState();
}

class _DetailBoardScreenState extends State<DetailBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailBoardCubit()..init(widget.boardModelLocal),
      child: BlocConsumer<DetailBoardCubit, DetailBoardState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state.boardModelLocal == null) {
            return const LoadingScreen();
          }
          return Scaffold(
            appBar: _appBar(context, state),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // unfocus(context)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditBoardScreen(
                          boardModelLocal: state.boardModelLocal)),
                ).then((value) {
                  context
                      .read<DetailBoardCubit>()
                      .getBoardCached(widget.boardModelLocal.id!);
                });
                // context.router
                //     .push(EditBoardPage(boardModelLocal: state.boardModelLocal))
                //     .then((value) {
                //   context
                //       .read<DetailBoardCubit>()
                //       .getBoardCached(widget.boardModelLocal.id!);
                // });
              },
              backgroundColor: primaryColor,
              elevation: 0,
              child: SvgPicture.asset(
                "assets/images/icons/edit.svg",
                color: Colors.white,
                width: 18,
              ),
            ),
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        FormatTime(state.boardModelLocal!.time).format(),
                        style: subTitleStyle.copyWith(
                            fontSize: 13, color: greyPrymaryColor),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: SvgPicture.asset(
                          "assets/images/icons/ellipse.svg",
                          color: greyPrymaryColor,
                          width: 3,
                        ),
                      ),
                      Text(
                        FormatDayShip(state.boardModelLocal!.time).format3(),
                        style: subTitleStyle.copyWith(
                            fontSize: 13, color: greyPrymaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    //margin: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      state.boardModelLocal!.title,
                      style: titleStyle.copyWith(
                          height: 1.3,
                          wordSpacing: 0.5,
                          letterSpacing: 0.5,
                          fontSize: 15,
                          color: Color(0xff1C2433)),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  state.boardModelLocal!.listImage != null &&
                          state.boardModelLocal!.listImage!.isNotEmpty
                      ? Container(
                          height: 90,
                          margin: EdgeInsets.symmetric(vertical: 14),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  state.boardModelLocal!.listImage?.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ShowImageScreen(
                                              image: state.boardModelLocal!
                                                  .listImage!)),
                                    );
                                    // context.router.push(ShowImagePage(
                                    //     image:
                                    //         state.boardModelLocal!.listImage!));
                                  },
                                  child: Container(
                                    width: 90,
                                    margin: EdgeInsets.only(right: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.memory(
                                        state
                                            .boardModelLocal!.listImage![index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      : Container(
                          height: 20,
                        ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context, DetailBoardState state) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: GestureDetector(
            onTap: () {
              context.read<DetailBoardCubit>().deleteBoard();
              // context.router.pop();
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              "assets/images/icons/delete.svg",
              color: greyPrymaryColor,
              width: 18,
            ),
          ),
        )
      ],
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
      ),
      title: Text(
        FormatDayShip(state.boardModelLocal!.time).format2(),
        style: titleStyle.copyWith(
          fontSize: 15,
        ),
      ),
    );
  }
}
