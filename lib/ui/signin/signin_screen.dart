import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager_example/const.dart';
import 'package:workmanager_example/data/cache_manager.dart';
import 'package:workmanager_example/data/model/user_local/user_model_local.dart';
import 'package:workmanager_example/ui/LandingScreen/components/default_button.dart';
import 'package:workmanager_example/ui/auth.dart';
import 'package:workmanager_example/ui/signin/forgot_password_screen.dart';
import 'package:workmanager_example/ui/signin/widget/forgot_password_screen.dart';
import 'package:workmanager_example/widget/text_form_field.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

enum AuthMode { login, register, forgotPass }

class _SigninScreenState extends State<SigninScreen> {
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
            register == false ? 'Đăng nhập' : 'Đăng ký',
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
                        height: 50,
                      ),
                      TextFormFieldInput(
                        hinText: 'email',
                        isEmail: true,
                        error: error,
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormFieldInput(
                        isPass: true,
                        hinText: 'mật khẩu',
                        error: error,
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      register == false
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: (() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordGmailScreen()),
                                    );
                                  }),
                                  child: Text(' Quyên mật khẩu?',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.orange[900],
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            )
                          : Container(),
                      const SizedBox(
                        height: 24,
                      ),
                      DefaultButton(
                        size: size,
                        title: register == false ? "Đăng nhập" : "Đăng ký",
                        press: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          List<String> account = await prefs.getStringList(
                                'accounts',
                              ) ??
                              [];
                          account = account.where((element) {
                                return element
                                    .contains(emailController.text ?? "");
                              }).toList() ??
                              [];
                          if (account.length > 0) {
                            Fluttertoast.showToast(
                                msg: "Tài khoản của bạn đã bị xoá");
                            return;
                          }
                          if (register == false) {
                            if (_formKey.currentState!.validate()) {
                              error = await Auth().signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              _cacheManager.addUserToCached(UserLocal(
                                  name: emailController.text,
                                  phone: passwordController.text));
                              print(error);
                              setState(() {
                                if (error != null && error!.isNotEmpty) {
                                  List<String> a = error!.split("]");
                                  error = a[1];
                                }
                              });
                            }
                          } else {
                            if (_formKey.currentState!.validate()) {
                              error =
                                  await Auth().createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              _cacheManager.addUserToCached(UserLocal(
                                  name: emailController.text,
                                  phone: passwordController.text));
                              register = false;
                            }
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      register == false
                          ? Row(
                              children: [
                                const Text('Chưa có tài khoản? ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey)),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      register = true;
                                    });
                                  },
                                  child: Text(' Đăng ký ngay',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.orange[900],
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                const Text('Đã có tài khoản? ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey)),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      register = false;
                                    });
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
                // renderBody(context, signInWithEmailAndPassword)
              ],
            )));
  }
}

Widget renderBody(BuildContext context, Future signInWithEmailAndPassword) {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Size size = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          TextFormFieldInput(
            hinText: 'email',
            isEmail: true,
            //error: error,
            controller: emailController,
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormFieldInput(
            isPass: true,
            hinText: 'mật khẩu',
            controller: passwordController,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (() {}),
                child: Text(' Quyên mật khẩu?',
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
          DefaultButton(
            size: size,
            title: "Đăng nhập",
            press: () async {
              await signInWithEmailAndPassword;
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen()),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text('Chưa có tài khoản? ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey)),
              GestureDetector(
                onTap: (() async {}),
                child: Text(' Đăng ký ngay',
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
  );
}

Widget renderHeader() {
  return Container(
    height: 100,
    alignment: Alignment.center,
    child: const Text(
      "Chào mừng đến với\n Smart Home",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 28, color: Colors.black, fontWeight: FontWeight.w700),
    ),
  );
}
