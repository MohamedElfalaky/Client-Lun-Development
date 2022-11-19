import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/data/cubits/BalanceCubit/BalanceCubit.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MyApplication.widthClc(context, 86),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20.sp), boxShadow: [
        BoxShadow(
          color: Color(0xFFF5504C).withOpacity(0.9),
          offset: Offset(0, 0),
        ),
        BoxShadow(
          color: Color(0xFFF5504C).withOpacity(0.2),
          offset: Offset(0, 15),
          blurStyle: BlurStyle.inner,
        )
      ]),
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: MyApplication.hightClc(context, 40),
                width: MyApplication.widthClc(context, 80),
                child: SvgPicture.asset(balance)

                // SvgPicture.asset(locationIcon)
                ),
            SizedBox(
              width: MyApplication.widthClc(context, 12),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  "Available Credit in Wallet",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Tajawal",
                    color: Color(0xFFF2F5F7),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BlocBuilder<BalanceCubit, BalanceState>(
                      builder: (context, state) {
                        return state is BalanceSuccess
                            ? AutoSizeText(
                                state.myBalanceModel.data!.balance.toString(),
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Tajawal",
                                  color: Color(0xFFF2F5F7),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                      },
                    ),
                    SizedBox(
                      width: MyApplication.widthClc(context, 8),
                    ),
                    const AutoSizeText(
                      "SAR",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Tajawal",
                        color: Color(0xFFF2F5F7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
