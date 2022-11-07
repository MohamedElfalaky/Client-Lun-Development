import 'package:client_app/data/cubits/cubit/check_phone_cubit.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/SendOTP/SendOTP.dart';
import 'package:client_app/presentation/shared/shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Registration extends StatefulWidget {
  const Registration({
    super.key,
  });
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _phone = TextEditingController();
  late String flagNumber = '+966';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: ListView(
                shrinkWrap: true,
                // reverse: true,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Align(
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
                  SvgPicture.asset(
                    'Logo'.tr(context),
                    color: Theme.of(context).colorScheme.primary,
                    semanticsLabel: 'Acme Logo',
                    width: 109,
                    height: 152,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
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
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
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
                  Align(
                    alignment: Alignment.centerLeft,
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
                              width: 348,
                              height: 48,
                              // color: const Color(0xffF2F2F2),
                              cursorColor: Theme.of(context).hintColor,
                              textSize: 16,
                              hint: 'Phone'.tr(context),
                              radius: 20,
                              borderColor: Colors.white,
                              // label: "Phone",
                              controller: _phone,
                              type: TextInputType.phone,
                              isBorder: true,
                              prefix: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .hintColor
                                        .withOpacity(0.2),
                                    // borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: DropdownButton(
                                      underline: Container(),
                                      iconSize: 24,
                                      value: '+966',
                                      items: [
                                        DropdownMenuItem(
                                          value: '+966',
                                          child: Image.asset(
                                            'icons/flags/png/sa.png',
                                            // color: Colors.green.withOpacity(0.2),
                                            // width: 24,
                                            // height: 24,
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
                              height: 45,
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
                                      MyApplication.showToast(
                                          text: state.checkPhone!.message!,
                                          color: ToastColors.success);
                                      MyApplication.navigateTo(
                                          SendOTP(phone: _phone.text), context);
                                    } else {
                                      if (kDebugMode) {
                                        print('phone is not exist');
                                      }

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
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      print(_phone.text);
                                      context
                                          .read<CheckPhoneCubit>()
                                          .checkPhone(_phone.text);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
