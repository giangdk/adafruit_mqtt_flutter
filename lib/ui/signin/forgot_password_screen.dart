import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:workmanager_example/const.dart';
import 'package:workmanager_example/data/cache_manager.dart';
import 'package:workmanager_example/ui/LandingScreen/components/default_button.dart';
import 'package:workmanager_example/ui/auth.dart';
import 'package:workmanager_example/widget/text_form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordGmailScreen extends StatefulWidget {
  const ForgotPasswordGmailScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordGmailScreen> createState() =>
      _ForgotPasswordGmailScreenState();
}

enum AuthMode { login, register, forgotPass }

class _ForgotPasswordGmailScreenState extends State<ForgotPasswordGmailScreen> {
  var items = ['Viet Nam', 'English'];
  final CacheManager _cacheManager = CacheManager.instance;
  String dropdownvalue = 'Viet Nam';
  bool checked = false;
  String? errorMessage = '';
  bool register = false;
  String? error;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Quyên mật khẩu",
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          elevation: 0,
          backgroundColor: kBgColor,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: kBgColor,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                renderHeader(),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormFieldInput(
                        hinText: 'email',
                        isEmail: true,
                        error: error,
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      DefaultButton(
                        size: size,
                        title: "Gửi đường dẫn lấy lại mật khẩu",
                        press: () async {
                          if (_formKey.currentState!.validate()) {
                            await Auth().sendPasswordResetEmail(
                              email: emailController.text,
                            );
                            Fluttertoast.showToast(
                                msg:
                                    "Gửi đường dẫn lấy lại mật khẩu thành công");
                            Timer(Duration(seconds: 1), () {
                              Navigator.pop(context);
                            });
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text('Đã có tài khoản? ',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey)),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(' Đăng nhập ngay',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.orange[900],
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}

Widget renderHeader() {
  return Container(
    height: 100,
    alignment: Alignment.center,
    child: const Text(
      "Gửi đường dẫn tới gmail để lấy lại mật khẩu",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 28, color: Colors.black, fontWeight: FontWeight.w700),
    ),
  );
}
