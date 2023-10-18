import 'package:auto_route/auto_route.dart';
import 'package:workmanager_example/ui/detail_board/detail_board.dart';
import 'package:workmanager_example/ui/edit_board/edit_board_screen.dart';
import 'package:workmanager_example/ui/image/image_screen.dart';
import 'package:workmanager_example/ui/router/app_router.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/annotations.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
        page: EditBoardScreen,
        name: "EditBoardPage",
        path: AppRoutes.editBoard),
    AutoRoute(
        page: DetailBoardScreen,
        name: "DetailBoardPage",
        path: AppRoutes.detailBoard),
    AutoRoute(
        page: ShowImageScreen,
        name: "ShowImagePage",
        path: AppRoutes.showImageScreen),
  ],
)
class $AppRouter {}

Widget slideBottomToTop(context, animation, secondaryAnimation, child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  const curve = Curves.fastLinearToSlowEaseIn;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
