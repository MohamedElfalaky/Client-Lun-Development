import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/LogIn/LogIn.dart';
import 'package:client_app/presentation/screens/LogIn/components/CountryPickerContainer.dart';
import 'package:client_app/presentation/widgets/MyFormTextField.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResetTextField extends StatefulWidget {
  const ResetTextField({super.key});

  @override
  State<ResetTextField> createState() => _ResetTextFieldState();
}

class _ResetTextFieldState extends State<ResetTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone Number",
          style: Theme.of(context).inputDecorationTheme.hintStyle,
        ),
        SizedBox(
          height: MyApplication.hightClc(context, 8),
        ),
        MyFormTextField(
          controller: phoneText,
          keyBrdType: TextInputType.number,
          myPrefix: GestureDetector(
              onTap: () async {
                final code = await countryPicker.showPicker(context: context);
                setState(() {
                  countryCode = code;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CountryPickerContainer(
                      child: countryCode != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: countryCode!.flagImage,
                            )
                          : SvgPicture.asset(
                              saudiArabia,
                            )),
                  Text("${countryCode?.dialCode ?? '+966'}")
                ],
              )),
          // initialValue: '+965',
          validator: (value) {
            if (value!.isEmpty) {
              return "please enter your phone number";
            } else if (value.isNotEmpty &&
                !RegExp(r'(^(?:[+0]9)?[0-9]{9}$)').hasMatch(phoneText.text)) {
              return "Invalide mobile number";
            }
            return null;
          },
          obscrdTxt: false,
        ),
      ],
    );
  }
}
