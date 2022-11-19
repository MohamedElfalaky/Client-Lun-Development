import 'package:client_app/data/cubits/cubit/check_phone_cubit.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/SendOTP/SendOTP.dart';
import 'package:client_app/presentation/widgets/shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Registration extends StatefulWidget {
  static const String routeName = '/registration';
  const Registration({
    super.key,
  });
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  static final _formKey = GlobalKey<FormState>();
  final TextEditingController _phone = TextEditingController();
  late String flagNumber = '+966';
  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = _phone.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'phoneRequired'.tr(context);
    }
    if (text.length < 8) {
      return 'phoneLength'.tr(context);
    }
    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.red,
          //   elevation: 0,
          //   leading: const MenuWidget(),
          // ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            child: ListView(
              shrinkWrap: true,
              // reverse: true,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 56),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 48,
                      width: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                              Theme.of(context).hintColor.withOpacity(0.2),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "❮",
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Theme.of(context).hintColor),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 37.86,
                ),
                SvgPicture.asset(
                  'Logo'.tr(context),
                  color: Theme.of(context).colorScheme.primary,
                  semanticsLabel: 'Acme Logo',
                  width: 109,
                  height: 152,
                ),
                const SizedBox(
                  height: 24.18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 134),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 240,
                      height: 43,
                      child: Text(
                        'create account'.tr(context),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline5!.color,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 66.0, left: 32),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 330,
                      height: 48,
                      child: Text(
                        "phoneOTP".tr(context),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: 16,
                          // fontWeight: FontWeight.w500,
                          letterSpacing: 0.8,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 380,
                      height: 325,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2,
                            // blurRadius: 5,
                            // offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'phoneNumber'.tr(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 16,
                                  // fontWeight: FontWeight.w500,
                                  // letterSpacing: 0.8,
                                  height: 3,
                                ),
                              ),
                              defaultTextField(
                                textColor: Theme.of(context).hintColor,
                                borderColor: Colors.white,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'phoneRequired'.tr(context);
                                  }
                                  if (value.length < 9 || value.length > 9) {
                                    return 'phoneLength'.tr(context);
                                  }
                                  if (!value.startsWith("5")) {
                                    return 'phone starts with 5';
                                  }
                                  return null;
                                },
                                // width: 348,
                                // height: 48,
                                // color: const Color(0xffF2F2F2),
                                cursorColor: Theme.of(context).hintColor,
                                textSize: 16,
                                hint: 'Phone'.tr(context),
                                radius: 10,

                                // borderColor: Colors.white,
                                // label: "Phone",
                                controller: _phone,
                                type: TextInputType.phone,
                                isBorder: true,
                                prefix: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    // margin: const EdgeInsets.only(left: 10),
                                    width: 68,
                                    height: 46,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .hintColor
                                          .withOpacity(0.2),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: DropdownButton(
                                        underline: const SizedBox(),
                                        elevation: 0,
                                        // iconSize: 12,
                                        value: '+966',
                                        items: [
                                          DropdownMenuItem(
                                            value: '+966',
                                            child: Image.asset(
                                              'icons/flags/png/sa.png',
                                              // color: Colors.green.withOpacity(0.2),
                                              width: 24,
                                              height: 24,
                                              package: 'country_icons',
                                            ),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            print(value);

                                            flagNumber = value.toString();
                                            print(flagNumber);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              SizedBox(
                                height: 56,
                                width: 347.8,
                                child: BlocConsumer<CheckPhoneCubit,
                                    CheckPhoneState>(
                                  listener: (context, state) {
                                    if (state is CheckPhoneLoaded) {
                                      print(state.checkPhone!.message);
                                      if (state.checkPhone!.success == true) {
                                        if (kDebugMode) {
                                          print('phone is exist');
                                        }
                                        // MyApplication.showToast(
                                        //     text: state.checkPhone!.message!,
                                        //     color: ToastColors.success);
                                        MyApplication.navigateTo(
                                            SendOTP(
                                                phone:
                                                    flagNumber + _phone.text),
                                            context);
                                      } else {
                                        if (kDebugMode) {
                                          print('phone is not exist');
                                        }
                                        // MyApplication.showToast(
                                        //     text: state.checkPhone!.message!,
                                        //     color: ToastColors.error);
                                        // navigateTo(
                                        //   context,
                                        //   PhoneOTP(
                                        //     phone: _phone.text,
                                        //     flagNumber: flagNumber,
                                        //   ),
                                        // );
                                      }
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is CheckPhoneLoading) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        // backgroundColor: Theme.of(context).hintColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          context
                                              .read<CheckPhoneCubit>()
                                              .checkPhone(
                                                  flagNumber + _phone.text);
                                        }
                                        print(flagNumber + _phone.text);
                                      },
                                      child: Text(
                                        'Next'.tr(context),
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          // fontWeight: FontWeight.bold,
                                          // letterSpacing: 0.8,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'alreadyHaveAccount'.tr(context),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 16,
                                      // fontWeight: FontWeight.w500,
                                      // letterSpacing: 0.8,
                                      height: 1.5,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Registration(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Login'.tr(context),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20,
                                        // fontWeight: FontWeight.w500,
                                        // letterSpacing: 0.8,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phone.dispose();
    super.dispose();
  }
}
