import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/pages/home/home_page.dart';
import 'package:training/pages/layout/layout_page.dart';
import 'package:training/pages/utils/app_color.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final TextEditingController _editingController = TextEditingController();
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/images/bg_login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          SizedBox(child: Image.asset('asset/images/logo.png')),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            "Xin chào bạn",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextField(
                            controller: _editingController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: AppColor.grey),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                borderSide: BorderSide(color: AppColor.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                borderSide: BorderSide(color: AppColor.grey),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            obscureText: controller.showPassword.value,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: const TextStyle(color: AppColor.grey),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                borderSide: BorderSide(color: AppColor.grey),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                borderSide: BorderSide(color: AppColor.grey),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                borderSide: BorderSide(color: AppColor.grey),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.showPassword.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColor.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    controller.showPassword.value =
                                        !controller.showPassword.value;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 55,
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.to(LayoutPage());
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: AppColor.primary,
                                  onPrimary: Colors.white,
                                ),
                                child: const Text(
                                  'Đăng nhập',
                                  style: TextStyle(fontSize: 16),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      child: Checkbox(
                                        checkColor:
                                            controller.rememberPassword.value
                                                ? AppColor.primary
                                                : Colors.transparent,
                                        activeColor: Colors.transparent,
                                        side: const BorderSide(
                                            color: AppColor.grey),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6))),
                                        value:
                                            controller.rememberPassword.value,
                                        onChanged: (value) {
                                          setState(() {
                                            controller.rememberPassword.value =
                                                !controller
                                                    .rememberPassword.value;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      'Ghi nhớ',
                                      style: TextStyle(color: AppColor.grey),
                                    ),
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Quên mật khẩu?',
                                      style: TextStyle(
                                        color: AppColor.primary,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
