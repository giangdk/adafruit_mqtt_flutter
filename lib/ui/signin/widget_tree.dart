import 'package:workmanager_example/data/cache_manager.dart';
import 'package:workmanager_example/ui/auth.dart';
import 'package:workmanager_example/ui/signin/signin_screen.dart';
import 'package:workmanager_example/ui/signin/widget/forgot_password_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  final CacheManager _cacheManager = CacheManager.instance;
  var checkLogin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  init() async {
    var a = await _cacheManager.getUserCached();
    if (a != null) {
      setState(() {
        checkLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        // print(snapshot.data?.uid.toString());
        // print(snapshot);
        init();
        var data = snapshot.data;
        if (snapshot.hasData) {
          // await _cacheManager
          //     .addUserToCached(UserLocal(name: data!.email ?? "", phone: ""));
          if (checkLogin) {
            return const ForgotPasswordScreen();
          } else
            return const SigninScreen();
        } else {
          return const SigninScreen();
        }
      },
    );
  }
}
