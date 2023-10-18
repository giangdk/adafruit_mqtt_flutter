import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:workmanager_example/data/cache_manager.dart';
import 'package:workmanager_example/data/model/board_local/board_model.dart';
import 'package:workmanager_example/ui/edit_board/cubit/edit_board_state.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as p;

class EditBoardCubit extends Cubit<EditBoardState> {
  EditBoardCubit() : super(EditBoardState.initial());
  final ImagePicker imagePicker = ImagePicker();
  final _cacheManager = CacheManager.instance;
  List<Uint8List> imageFileList = [];
  handlePickImage(ImageSource source) async {
    // isLoadingUpdateImage(true);
    final permission =
        source == ImageSource.camera ? Permission.camera : ImageSource.gallery;

    final pickedFile = await imagePicker.pickImage(
      source: source,
    );
    if (pickedFile == null) {
      return;
    }

    final fileExtension = p.extension(pickedFile.path).replaceAll('.', '');
    if (fileExtension != 'png' &&
        fileExtension != 'jpg' &&
        fileExtension != 'jpeg') {
      if (pickedFile != null) {
        Fluttertoast.showToast(msg: "định dạng ảnh không được hỗ trợ");
      }
    } else {
      Uint8List imageBytes = await pickedFile.readAsBytes();
      imageFileList.add(imageBytes);
      emit(state.copyWith(imageFileList: [...state.imageFileList, imageBytes]));
    }
  }

  void init(BoardModelLocal? boardModelLocal) async {
    if (boardModelLocal != null) {
      emit(state.copyWith(
          boardModelLocal: boardModelLocal,
          title: boardModelLocal.title,
          day: boardModelLocal.time,
          imageFileList: boardModelLocal.listImage ?? []));
    }
  }

  void setDay(DateTime day) {
    emit(state.copyWith(day: day));
  }

  getFromCamera() async {
    final XFile? pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      Uint8List imageBytes = await pickedFile.readAsBytes();
      imageFileList.add(imageBytes);
      emit(state.copyWith(imageFileList: [...state.imageFileList, imageBytes]));
    }
  }

  deleteImage(int index) {
    List<Uint8List> a = [];
    for (int i = 0; i < state.imageFileList.length; i++) {
      if (i != index) {
        a.add(state.imageFileList[i]);
      }
    }
    emit(state.copyWith(imageFileList: a));
  }

  void save(
      {required String title,
      String? content,
      required DateTime time,
      required String model,
      required Duration timeDuration,
      required String statusModel}) async {
    if (state.boardModelLocal != null) {
      _cacheManager.addBoardToCache(BoardModelLocal(
          id: state.boardModelLocal!.id,
          title: title,
          time: time,
          model: model,
          timeDuration: timeDuration.inMinutes,
          statusModel: statusModel,
          listImage: state.imageFileList));
    } else {
      _cacheManager.addBoardToCache(BoardModelLocal(
        title: title,
        time: time,
        listImage: state.imageFileList,
        model: model,
        timeDuration: timeDuration.inMinutes,
        statusModel: statusModel,
      ));
    }
  }
}
