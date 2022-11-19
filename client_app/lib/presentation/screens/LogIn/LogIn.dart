<<<<<<< HEAD
import 'package:client_app/data/cubits/Login_cubit/login_cubit.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/LogIn/components/Buttons.dart';
import 'package:client_app/presentation/screens/LogIn/components/PasswordTextField.dart';
import 'package:client_app/presentation/screens/LogIn/components/PhoneTextField.dart';
import 'package:client_app/style/icons.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

const countryPicker = FlCountryCodePicker();

CountryCode? countryCode;
final passwordText = TextEditingController();
final phoneText = TextEditingController();
final _formKey = GlobalKey<FormState>();

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // for background
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(loginBackground), fit: BoxFit.cover)),
      child: GestureDetector(
        //  hide keyboard on tap anywhere
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MyApplication.widthClc(context, 24)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MyApplication.hightClc(context, 60),
                      ),
                      SvgPicture.asset(
                        logInLogo,
                        height: MyApplication.hightClc(context, 153),
                        width: MyApplication.widthClc(context, 110),
                      ),
                      SizedBox(
                        height: MyApplication.hightClc(context, 24),
                      ),
                      const Text(
                        "Hello Again !",
                        style:
                            TextStyle(color: Color(0xFFEDEDF4), fontSize: 42),
                      ),
                      const Text(
                        "Welcome back your've been missed",
                        style: TextStyle(
                            color: Color(
                              0xFFEDEDF4,
                            ),
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: MyApplication.hightClc(context, 48),
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: MyApplication.widthClc(context, 16),
                              vertical: MyApplication.hightClc(context, 24)),
                          // height: MyApplication.hightClc(context, 417),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.8),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const PhoneTextField(),
                              BlocConsumer<LoginCubit, LoginState>(
                                  listener: (context, state) {
                                // TODO: implement listener
                              }, builder: (context, state) {
                                return const PasswordTextField();
                              }),
                              Buttons(
                                formKey: _formKey,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MyApplication.hightClc(context, 80),
                      ),
                      const Text(
                        "All Rights Reserved LUN Development 2021©",
                        style: TextStyle(color: Color(0xFFEDEDF4)),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
=======
import 'package:client_app/data/cubits/Login_cubit/login_cubit.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/LogIn/components/Buttons.dart';
import 'package:client_app/presentation/screens/LogIn/components/PhoneTextField.dart';
import 'package:client_app/presentation/screens/LogIn/components/PasswordTextField.dart';
import 'package:client_app/style/icons.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

const countryPicker = FlCountryCodePicker();
final phoneText = TextEditingController();
final passwordText = TextEditingController();

CountryCode? countryCode;

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // for background
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(loginBackground), fit: BoxFit.cover)),
      child: GestureDetector(
        //  hide keyboard on tap anywhere
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MyApplication.widthClc(context, 24)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MyApplication.hightClc(context, 60),
                      ),
                      SvgPicture.asset(
                        logInLogo,
                        height: MyApplication.hightClc(context, 153),
                        width: MyApplication.widthClc(context, 110),
                      ),
                      SizedBox(
                        height: MyApplication.hightClc(context, 24),
                      ),
                      const Text(
                        "Hello Again !",
                        style:
                            TextStyle(color: Color(0xFFEDEDF4), fontSize: 42),
                      ),
                      const Text(
                        "Welcome back your've been missed",
                        style: TextStyle(
                            color: Color(
                              0xFFEDEDF4,
                            ),
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: MyApplication.hightClc(context, 48),
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: MyApplication.widthClc(context, 16),
                              vertical: MyApplication.hightClc(context, 24)),
                          // height: MyApplication.hightClc(context, 417),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.8),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PhoneTextField(),
                              BlocConsumer<LoginCubit, LoginState>(
                                  listener: (context, state) {
                                // TODO: implement listener
                              }, builder: (context, state) {
                                return PasswordTextField();
                              }),
                              Buttons(
                                formKey: _formKey,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MyApplication.hightClc(context, 80),
                      ),
                      Text(
                        "All Rights Reserved LUN Development 2021©",
                        style: TextStyle(color: Color(0xFFEDEDF4)),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
>>>>>>> 6775c8401b8b37b6b4906678bcecdc2e1f06a5f3
