import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../presentation/constants/assets.dart';
import '../../presentation/constants/color.dart';
import '../../presentation/constants/fonts.dart';
import '../../presentation/constants/strings.dart';
import '../../presentation/screens/dashboard/dashboard_view.dart';
import '../../presentation/screens/login_register/register.dart';
import '../../presentation/screens/message/forget_password.dart';
import '../../provider/auth/login_provider.dart';
import 'appname.dart';

class OnbarodingScreen1 extends StatefulWidget {
  const OnbarodingScreen1({super.key});

  @override
  State<OnbarodingScreen1> createState() => _OnbarodingScreen1State();
}

class _OnbarodingScreen1State extends State<OnbarodingScreen1> {
  bool isRememberMeChecked = false;

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Row(
        children: [
          const AppNameScreen(),
          Flexible(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(32.0),
                    decoration: BoxDecoration(
                      color: MyColors.blueContainer,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    width: 400.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          AppStrings.signIn,
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          AppStrings.happy,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 32.0),
                        Text(
                          "EMAIL",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: Fonts.fontsinter,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff999999),
                          ),
                        ),
                        TextFormField(
                          validator: (value) =>
                              loginProvider.validateEmail(value ?? ""),
                          controller: loginProvider.emailController,
                          decoration: InputDecoration(
                            hintText: AppStrings.enterUrEmail,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.grey.withOpacity(0.7)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.grey.withOpacity(0.7)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          AppStrings.passWord,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: Fonts.fontsinter,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff999999),
                          ),
                        ),
                        TextFormField(
                          validator: (value) =>
                              loginProvider.validatePassword(value ?? ""),
                          controller: loginProvider.passwordController,
                          obscureText: loginProvider.obscureText,
                          decoration: InputDecoration(
                            hintText: AppStrings.enterUrPassWord,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.grey.withOpacity(0.7)),
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  loginProvider.togglePasswordVisibility();
                                },
                                icon: Icon(loginProvider.obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.grey.withOpacity(0.7)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: isRememberMeChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isRememberMeChecked = value!;
                                    });
                                  },
                                ),
                                const Text(AppStrings.remaindMe),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        //StockHubPage()
                                        // AddStockRequest()
                                        const ForgetPasswordScreen()));
                              },
                              child: const Text(
                                AppStrings.forgetPassword,
                                style: TextStyle(
                                  fontFamily: 'inter',
                                  color: Color(0xff176AA7),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  decorationColor: Color(0xff176AA7),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32.0),
                        if (loginProvider.isLoading)
                          const CircularProgressIndicator()
                        else
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                bool loginSuccess = await loginProvider.login(
                                  context: context,
                                  email: loginProvider.emailController.text,
                                  password:
                                  loginProvider.passwordController.text,
                                );
                                print(
                                    "email=======> ${loginProvider.emailController.text}");
                                print(
                                    "password=======> ${loginProvider.passwordController.text}");

                                if (loginSuccess) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        //StockHubPage()
                                        // AddStockRequest()
                                        const DashBoardView()),
                                  );
                                  Future.delayed(const Duration(seconds: 5),
                                          () {
                                        loginProvider.emailController.clear();
                                        loginProvider.passwordController.clear();
                                      });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Login failed. Please check your credentials and try again.',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: MyColors.black1,
                                        ),
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.blue,
                                padding: const EdgeInsets.all(10),
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppStrings.signIn,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: Fonts.fontsinter,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  SvgPicture.asset(Assets.check),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              AppStrings.dontHaveAccount,
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        //StockHubPage()
                                        // AddStockRequest()
                                        const RegisterScreen()));
                              },
                              child: Text(
                                AppStrings.register,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: Fonts.fontsinter,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.btnColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
