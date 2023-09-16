import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:taskhaztec/Data/AppData/app_preferences.dart';

import 'package:taskhaztec/Presentation/Widgets/locale_cubit.dart';

class LanguageDropDownWidget extends StatefulWidget {
  final Color? textColor;
  const LanguageDropDownWidget({Key? key,this.textColor}) : super(key: key);

  @override
  State<LanguageDropDownWidget> createState() => _LanguageDropDownWidgetState();
}

class _LanguageDropDownWidgetState extends State<LanguageDropDownWidget> {
  //bool check = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, bool?>(
      builder: (context, isEnglish) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.sp),
          alignment:isEnglish!?Alignment.centerLeft: Alignment.centerRight,
          child: InkWell(
            onTap: ()async {
              switch (isEnglish) {
                case false:
                  const _newLocale = Locale('en', 'EN');
                  await context
                      .setLocale(_newLocale); // change `easy_localization` locale
                 Get.updateLocale(_newLocale);
                  SharedPrefs().setLocale(langLocale: true);
                  SharedPrefs().getLocale().then((value) {
                    BlocProvider.of<LocaleCubit>(context).setLocale(value: value);
                  });

                  break;
                case true:
                  const _newLocale = Locale('ar', 'AR');

                  await context
                      .setLocale(_newLocale); // change `easy_localization` locale
                 Get.updateLocale(_newLocale);
                  SharedPrefs().setLocale(langLocale: false);
                  SharedPrefs().getLocale().then((value) {
                    BlocProvider.of<LocaleCubit>(context).setLocale(value: value);
                  });

                  break;
              }
            },
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(isEnglish? "Arabic" :"English", style: TextStyle(
                color: widget.textColor??Colors.white70,
                decoration: TextDecoration.underline,
                fontSize: 16.sp,

              ),),
            ),
          ),
        );
      },
    );
  }
}
