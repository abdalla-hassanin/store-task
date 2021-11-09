import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_task/views/utils/strings.dart';

import '../component/shared.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
   var firstNameController = TextEditingController();
   var lastNameController = TextEditingController();
   var userNameController = TextEditingController();
   var emailController = TextEditingController();
  var passwordController = TextEditingController();
   var confirmPasswordController = TextEditingController();
   var phoneController = TextEditingController();


   @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
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
                    Text(StringConst.createAccount, style: theme.textTheme.headline5),
                    buildSpaceH(20),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: buildTextField(
                            controller: firstNameController,
                            type: TextInputType.name,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return StringConst.required;
                              }
                            },
                            label: StringConst.firstName,
                            hint: StringConst.nameHintText)),
                    buildSpaceH(16),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: buildTextField(
                            controller: lastNameController,
                            type: TextInputType.name,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return StringConst.required;
                              }
                            },
                            label: StringConst.lastName,
                            hint: StringConst.nameHintText)),
                    buildSpaceH(16),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: buildTextField(
                            controller: userNameController,
                            type: TextInputType.name,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return StringConst.required;
                              }
                            },
                            label: StringConst.userName,
                            hint: StringConst.nameHintText)),
                    buildSpaceH(16),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: buildTextField(
                            controller: phoneController,
                            type: TextInputType.number,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return StringConst.required;
                              }
                            },
                            label: StringConst.phone,
                            hint: StringConst.phoneHintText)),
                    buildSpaceH(16),
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
                        padding:  const EdgeInsets.symmetric(horizontal: 24),
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
                            hint: StringConst.passwordHintText)
                    ),
                    buildSpaceH(16),
                    Padding(
                        padding:  const EdgeInsets.symmetric(horizontal: 24),
                        child: buildTextField(
                            isPassword: true,
                            controller: confirmPasswordController,
                            type: TextInputType.visiblePassword,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return StringConst.validatePassword;
                              }
                              else if(passwordController.text!=confirmPasswordController.text){
                                return StringConst.validateConfirmPassword;
                              }
                            },
                            label: StringConst.confirmPassword,
                            hint: StringConst.passwordHintText)
                    ),
                    buildSpaceH(30),
                    Container(
                        height: 56,
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        child:

                        MaterialButton(
                          onPressed: () {

                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 50,
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  <Widget>[
                              Text(
                                StringConst.createAccount,
                                style: theme.textTheme.headline6!.copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        )
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          bottom: 2, // space between underline and text
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: StringConst.alreadyHaveAnAccount,
                            style: theme.textTheme.bodyText2!,
                            children: <TextSpan>[
                              TextSpan(
                                text: StringConst.login,
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
      ),
    );
  }
}
