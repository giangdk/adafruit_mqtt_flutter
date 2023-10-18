// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i7;

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../data/model/board_local/board_model.dart' as _i6;
import '../detail_board/detail_board.dart' as _i2;
import '../edit_board/edit_board_screen.dart' as _i1;
import '../image/image_screen.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    EditBoardPage.name: (routeData) {
      final args = routeData.argsAs<EditBoardPageArgs>(
          orElse: () => const EditBoardPageArgs());
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.EditBoardScreen(
          key: args.key,
          boardModelLocal: args.boardModelLocal,
        ),
      );
    },
    DetailBoardPage.name: (routeData) {
      final args = routeData.argsAs<DetailBoardPageArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.DetailBoardScreen(
          key: args.key,
          boardModelLocal: args.boardModelLocal,
        ),
      );
    },
    ShowImagePage.name: (routeData) {
      final args = routeData.argsAs<ShowImagePageArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ShowImageScreen(
          key: args.key,
          image: args.image,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          EditBoardPage.name,
          path: '/editBoard',
        ),
        _i4.RouteConfig(
          DetailBoardPage.name,
          path: '/detailBoardScreen',
        ),
        _i4.RouteConfig(
          ShowImagePage.name,
          path: '/ShowImageScreen',
        ),
      ];
}

/// generated route for
/// [_i1.EditBoardScreen]
class EditBoardPage extends _i4.PageRouteInfo<EditBoardPageArgs> {
  EditBoardPage({
    _i5.Key? key,
    _i6.BoardModelLocal? boardModelLocal,
  }) : super(
          EditBoardPage.name,
          path: '/editBoard',
          args: EditBoardPageArgs(
            key: key,
            boardModelLocal: boardModelLocal,
          ),
        );

  static const String name = 'EditBoardPage';
}

class EditBoardPageArgs {
  const EditBoardPageArgs({
    this.key,
    this.boardModelLocal,
  });

  final _i5.Key? key;

  final _i6.BoardModelLocal? boardModelLocal;

  @override
  String toString() {
    return 'EditBoardPageArgs{key: $key, boardModelLocal: $boardModelLocal}';
  }
}

/// generated route for
/// [_i2.DetailBoardScreen]
class DetailBoardPage extends _i4.PageRouteInfo<DetailBoardPageArgs> {
  DetailBoardPage({
    _i5.Key? key,
    required _i6.BoardModelLocal boardModelLocal,
  }) : super(
          DetailBoardPage.name,
          path: '/detailBoardScreen',
          args: DetailBoardPageArgs(
            key: key,
            boardModelLocal: boardModelLocal,
          ),
        );

  static const String name = 'DetailBoardPage';
}

class DetailBoardPageArgs {
  const DetailBoardPageArgs({
    this.key,
    required this.boardModelLocal,
  });

  final _i5.Key? key;

  final _i6.BoardModelLocal boardModelLocal;

  @override
  String toString() {
    return 'DetailBoardPageArgs{key: $key, boardModelLocal: $boardModelLocal}';
  }
}

/// generated route for
/// [_i3.ShowImageScreen]
class ShowImagePage extends _i4.PageRouteInfo<ShowImagePageArgs> {
  ShowImagePage({
    _i5.Key? key,
    required List<_i7.Uint8List> image,
  }) : super(
          ShowImagePage.name,
          path: '/ShowImageScreen',
          args: ShowImagePageArgs(
            key: key,
            image: image,
          ),
        );

  static const String name = 'ShowImagePage';
}

class ShowImagePageArgs {
  const ShowImagePageArgs({
    this.key,
    required this.image,
  });

  final _i5.Key? key;

  final List<_i7.Uint8List> image;

  @override
  String toString() {
    return 'ShowImagePageArgs{key: $key, image: $image}';
  }
}
