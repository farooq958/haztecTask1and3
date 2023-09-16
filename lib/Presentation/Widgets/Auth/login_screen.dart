import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskhaztec/Application/Services/Navigation/navigation.dart';
import 'package:taskhaztec/Data/DataSource/Resources/assets.dart';
import 'package:taskhaztec/Data/DataSource/Resources/imports.dart';
import 'package:taskhaztec/Data/DataSource/Resources/sized_box.dart';
import 'package:taskhaztec/Data/DataSource/Resources/validator.dart';
import 'package:taskhaztec/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:taskhaztec/Presentation/Common/app_button.dart';
import 'package:taskhaztec/Presentation/Common/widget_functions.dart';
import 'package:taskhaztec/Presentation/Widgets/Auth/Controller/login_cubit.dart';
import 'package:taskhaztec/Presentation/Widgets/Dashboard/BottomNavigation/bottom_navigation_screen.dart';
import 'package:taskhaztec/Presentation/Widgets/locale_cubit.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool iconVisible = true;
  bool? checkTheMark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(

          children: [
            Container(
              height: 1.sh / 2.3,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.00, 0.00),
                  end: Alignment(-1, 0),
                  colors: [AppColors.primaryColor, AppColors.darkPrimaryColor],
                ),

              ),
              child: Column(

                children: [

                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Align(child: AppText(
                        AppStrings.stcHealth, style: Styles.openSansStdMedium(
                          context, fontSize: 35.sp), maxLine: 2,)),
                    ),
                  )
                  ,
                  BlocBuilder<LocaleCubit, bool?>(
                    builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.only(left:state ==true? 20.0.sp:0.sp, bottom: 30.sp,right:state ==false? 20.0.sp:0.sp ),
                        child: Align(
                            alignment: state==true? Alignment.centerLeft:Alignment.centerRight,

                            child: AppText(AppStrings.login.tr(),
                              style: Styles.openSansStdBold(
                                  context, fontSize: 25.sp), maxLine: 1,)),
                      );
                    },
                  ),
                  // 30.y
                ],

              ),
            ),
            50.y,
            Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.sp),
                  child: BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginLoading) {
                        LoadingDialog.showLoadingDialog(context);
                      }
                      if (state is LoginSuccess) {
                        Navigate.pop(context);
                        WidgetFunctions.instance.snackBar(context,
                            text: 'Login Successfully!',
                            bgColor: AppColors.primaryColor);

                        Navigate.toReplaceAll(
                            context,
                            const BottomNavigationScreen(

                            ));
                      }
                      if (state is LoginError) {
                        Navigate.pop(context);
                        WidgetFunctions.instance.snackBar(context,
                            text: state.error, bgColor: AppColors.primaryColor);
                        //  CustomDialog.dialog(context, Center(child: AppText(state.error,style: Styles.circularStdRegular(context,color: AppColors.blackColor),),));
                      }

                      // TODO: implement listener
                    },
                    child: Column(

                      children: [

                        CustomTextFieldWithOnTap(
                          controller: userNameController,
                          hintText: 'UserName'.tr(),
                          validator: Validate.userName,
                          hintTextColor: AppColors.greyColor,
                          // validateText: 'required card code',
                          textInputType: TextInputType.text,
                          titleTextColor: Colors.black,
                          onChanged: (val) {
                            setState(() {
                              checkTheMark = Validate.userNameCheck(val);
                            });
                          },
                          suffixIcon: checkTheMark == true
                              ? SvgPicture.asset(Assets.checkMarkIcon)
                              : checkTheMark == false ?
                          SvgPicture.asset(Assets.checkCrossIcon)
                              : null,
                          // prefixIcon: const Icon(Icons.email),
                          isShadowRequired: true,
                          labelText: 'UserName'.tr(),
                          isBorderRequired: false,
                          borderRadius: 2.r,
                        ),
                        CustomTextFieldWithOnTap(
                          controller: passwordController,
                          //validateText: 'required password',
                          hintText: 'Password'.tr(),
                          labelText: 'Password'.tr(),
                          textInputType: TextInputType.visiblePassword,
                          titleTextColor: Colors.black,
                          hintTextColor: AppColors.greyColor,
                          // prefixIcon: const Icon(Icons.lock),
                          obscureText: iconVisible,
                          borderRadius: 2.r,
                          suffixIcon: InkWell(
                              onTap: () {
                                iconVisible = !iconVisible;
                                setState(() {});
                              },
                              child: Icon(iconVisible == true
                                  ? Icons.visibility
                                  : Icons.visibility_off)
                          ),
                          isShadowRequired: true,
                          isBorderRequired: false,
                          validator: Validate.password,
                        ),
                        10.y,
                        CustomButton(
                            borderRadius: 40.r,
                            verticalMargin: 20,
                            height: 70.sp,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                var body = {
                                  "username": userNameController.text,
                                  "password": passwordController.text
                                };

                                context.read<LoginCubit>().loginIt(body);
                              } else {}
                              //  LoadingDialog.showLoadingDialog(context);
                              // Navigate.to(context, const BottomNavigationScreen(isGuest: false,));
                              // BottomNotifier.bottomNavigationNotifier.value=0;
                            },
                            text: AppStrings.continueString.tr()),
                        // CustomSizedBox.height(2.h),
                        CustomButton(
                          onTap: () {
                            Navigate.to(
                                context,
                                const BottomNavigationScreen(

                                ));
                          },
                          text: AppStrings.needHelp.tr(),
                          bgColor: Colors.transparent,
                          borderColor: Colors.transparent,
                          textColor: AppColors.blackColor,
                        )

                      ],
                    ),
                  ),
                ))

          ],

        ),
      ),

    );
  }
}
