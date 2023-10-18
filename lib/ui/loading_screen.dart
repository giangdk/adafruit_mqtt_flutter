import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(child: Container(), isLoading: true);
  }
}
