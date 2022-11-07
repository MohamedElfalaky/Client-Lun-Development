import 'package:client_app/data/cubits/cubit/check_phone_cubit.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/SendOTP/SendOTP.dart';
import 'package:client_app/presentation/shared/shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({
    super.key,
  });
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                    child: Row(
                      children: [
                        Text(
                          'welcome to'.tr(context),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline5!.color,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.1),
                        ),
                        Text(
                          'talabatkom'.tr(context),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'agree'.tr(context),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'privacy policy'.tr(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 16,
                                  height: -.5,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'terms of use'.tr(context),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                    height: -.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 380,
                      height: 425,
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
                              'username'.tr(context),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .color,
                                fontSize: 16,
                                // fontWeight: FontWeight.w500,
                                // letterSpacing: 0.8,
                                height: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            defaultTextField(
                              width: 348,
                              height: 48,
                              // color: const Color(0xffF2F2F2),
                              cursorColor: Theme.of(context).hintColor,
                              textSize: 16,
                              hint: 'type your name'.tr(context),
                              radius: 20,
                              borderColor: Colors.white,
                              // label: "Phone",
                              controller: _phone,
                              type: TextInputType.phone,
                              isBorder: true,
                            ),
                            Text(
                              'password'.tr(context),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .color,
                                fontSize: 16,
                                // fontWeight: FontWeight.w500,
                                // letterSpacing: 0.8,
                                height: 3,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            defaultTextField(
                              width: 348,
                              height: 48,
                              // color: const Color(0xffF2F2F2),
                              cursorColor: Theme.of(context).hintColor,
                              textSize: 16,
                              // hint: 'type your name'.tr(context),
                              label: 'password'.tr(context),
                              radius: 20,
                              borderColor: Colors.white,
                              // label: "Phone",
                              controller: _phone,
                              type: TextInputType.phone,
                              isBorder: true,
                            ),
                            Text(
                              'password hint'.tr(context),
                              style: TextStyle(
                                  height: 2,
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .color),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Text(
                              'confirm password'.tr(context),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .color,
                                fontSize: 16,
                                // fontWeight: FontWeight.w500,
                                // letterSpacing: 0.8,
                                height: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            defaultTextField(
                              width: 348,
                              height: 48,
                              // color: const Color(0xffF2F2F2),
                              cursorColor: Theme.of(context).hintColor,
                              textSize: 16,
                              // hint: 'type your name'.tr(context),
                              label: 'confirm password'.tr(context),
                              radius: 20,
                              borderColor: Colors.white,
                              // label: "Phone",
                              controller: _phone,
                              type: TextInputType.phone,
                              isBorder: true,
                            ),
                            Text(
                              'confirm password hint'.tr(context),
                              style: TextStyle(
                                  height: 2,
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .color),
                            ),
                            const Spacer(),
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
                                      showToast(
                                        state.checkPhone!.message!,
                                      );
                                      MyApplication.navigateTo(
                                        SendOTP(phone: _phone.text),
                                        context,
                                      );
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
                                      'register'.tr(context),
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
