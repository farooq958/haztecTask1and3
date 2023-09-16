import 'package:easy_localization/easy_localization.dart';
import 'package:taskhaztec/Data/DataSource/Resources/imports.dart';
import 'package:taskhaztec/Presentation/Widgets/Dashboard/Localisation/Component/localizationText.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  bool isHome;
  bool isShowNotificationButton;
  final VoidCallback? onBackTap;

  CustomAppBar({key,
    required this.title,
    this.isHome = false,
    this.isShowNotificationButton = true, this.onBackTap})
      : preferredSize = const Size.fromHeight(65),
        super(key: key);
  @override
  final Size preferredSize;

  @override
  CustomAppBarState createState() => CustomAppBarState();


}
class CustomAppBarState extends State<CustomAppBar> {


  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 8,
      shadowColor: Colors.black12,
      backgroundColor: AppColors.whiteColor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: const SizedBox(

          height: 40,
          width: 100,
          child: LanguageDropDownWidget(textColor: AppColors.darkPrimaryColor,)),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.r),bottomRight: Radius.circular(60.r)), // Adjust the radius as needed
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 5).r,
        child: AppText(
          widget.title.tr(),
          style: Styles.openSansStdBold(
            context,
            color: AppColors.blackColor,
            fontSize: 25.sp,
          ),
        ),
      ),

    );
  }
}