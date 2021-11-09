import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_task/controllers/app_controller.dart';
import 'package:store_task/views/screen/register_screen.dart';
import 'package:store_task/views/utils/strings.dart';

import '../component/shared.dart';
import 'category_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final AppController controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          Form(
            key: formKey,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const Spacer(),
                  Text(StringConst.login, style: theme.textTheme.headline5),
                  buildSpaceH(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: width * 0.35,
                          child: MaterialButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            height: 50,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/google.png',
                                  width: 24,
                                  height: 24,
                                ),
                                buildSpaceW(8),
                                const Text(
                                  StringConst.google,
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                          width: width * 0.35,
                          child: MaterialButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            height: 50,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/facebook.png',
                                  width: 24,
                                  height: 24,
                                ),
                                buildSpaceW(8),
                                const Text(
                                  StringConst.facebook,
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                  buildSpaceH(20),
                  Text(
                    StringConst.or,
                    style: theme.textTheme.bodyText1,
                  ),
                  buildSpaceH(20),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: buildTextField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return StringConst.validateEmail;
                            }
                          },
                          label: StringConst.email,
                          hint: StringConst.emailHintText)),
                  buildSpaceH(16),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: buildTextField(
                          isPassword: true,
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return StringConst.validatePassword;
                            }
                          },
                          label: StringConst.password,
                          hint: StringConst.passwordHintText)),
                  buildSpaceH(30),
                  Container(
                      height: 56,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: MaterialButton(
                        onPressed: () {
                          Get.off(() => CategoryScreen());
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 50,
                        color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              StringConst.login,
                              style: theme.textTheme.headline6!
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      )),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.to(() => RegisterScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        bottom: 2, // space between underline and text
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: StringConst.doNotHaveAnAccount,
                          style: theme.textTheme.bodyText2!,
                          children: <TextSpan>[
                            TextSpan(
                              text: StringConst.createAccount,
                              style: theme.textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  buildSpaceH(16)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
