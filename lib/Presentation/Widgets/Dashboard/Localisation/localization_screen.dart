import 'package:easy_localization/easy_localization.dart';
import 'package:taskhaztec/Data/DataSource/Resources/imports.dart';
import 'package:taskhaztec/Presentation/Widgets/Dashboard/ProductHome/Component/CustomAppBar/cutom_product_app_bar.dart';

import 'Component/localizationText.dart';

class LocalizationScreen extends StatelessWidget {
  const LocalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    //  appBar: CustomAppBar(title: 'Localization Page',),

      body: Column(
        children: [
Container(
height: 110.sp,
  width: 1.sw,

  decoration: const BoxDecoration(shape: BoxShape.rectangle,color: AppColors.primaryColor),

child: Stack(
  children: <Widget>[


Padding(
  padding: const EdgeInsets.only(top: 18.0),
  child:   Align(alignment: Alignment.center,
      child: AppText('Localization Page'.tr(), style: Styles.openSansStdBold(context,color: AppColors.whiteColor,fontSize: 25))),
),
    Positioned(
        bottom: 1.h,
        top: 20,
        child: const SizedBox(
            height: 100, width: 70, child: LanguageDropDownWidget())),

  ],
),


),
          50.y,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: AppText('LocalizedTest'.tr(),
                maxLine: 20,
                style: Styles.openSansStdMedium(context,color: AppColors.blackColor)),
          )


        ],



      ),

    );
  }
}
