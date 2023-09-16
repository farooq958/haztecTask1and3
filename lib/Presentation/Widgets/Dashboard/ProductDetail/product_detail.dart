import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskhaztec/Application/Services/Navigation/navigation.dart';
import 'package:taskhaztec/Data/DataSource/Resources/assets.dart';
import 'package:taskhaztec/Data/DataSource/Resources/imports.dart';
import 'package:taskhaztec/Domain/Models/ProductModels/product_model.dart';
import 'package:taskhaztec/Presentation/Common/app_button.dart';
import 'package:taskhaztec/Presentation/Common/custom_rating_bar.dart';
import 'package:taskhaztec/Presentation/Common/image_widgets.dart';
import 'package:taskhaztec/Presentation/Widgets/Dashboard/ProductDetail/Controller/Notifier/height_notifier.dart';
import 'package:taskhaztec/Presentation/Widgets/locale_cubit.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel pd;
  const ProductDetail({super.key, required this.pd});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Container(
        height: 1.sh,
        width: 1.sw,
     decoration: BoxDecoration(
       gradient: LinearGradient(
         begin: const Alignment(-0.00, 1.00),
         end: const Alignment(0, -1),
         colors: [Colors.black.withOpacity(0.000099), AppColors.darkBrownColor.withOpacity(0.7)],
       ),
     ),
   //  color: AppColors.lightBrownColor,
        child: Column(children: [
Expanded(
  flex: 0,
  child:   Container(

    width: 403.85.sp,
    height: 164.77.sp,
    decoration: const BoxDecoration(
      // gradient: LinearGradient(
      //   begin: const Alignment(-0.00, 1.00),
      //   end: const Alignment(0, -1),
      //   colors: [Colors.black.withOpacity(0.00009999999747378752), Colors.black.withOpacity(0.6000000238418579)],
      // ),
    ),
  child: Column(children: [
  SizedBox(height: 50.sp,),
    ///Top row
    Row(
                      children: <Widget>[

  GestureDetector(
    onTap: ()
    {
      Navigate.pop(context);

    },
    child:   Container(
      width: 40.w,
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 48,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
    child: const Icon(Icons.arrow_back),
    ),
  ),
                        const Spacer(),
                        Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.symmetric(horizontal: 10.sp),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x0A000000),
                                blurRadius: 48,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: PopupMenuButton<String>(
                            onSelected: (String choice) {
                              // Handle the choice selected from the popup menu
                              if (choice == 'Option 1') {
                                // Perform an action for Option 1
                                print('Option 1 selected');
                              } else if (choice == 'Option 2') {
                                // Perform an action for Option 2
                                print('Option 2 selected');
                              }
                            },
                            offset: const Offset(2,20),
                            itemBuilder: (BuildContext context) {
                              return [
                                const PopupMenuItem<String>(
                                  value: 'Option 1',
                                  child: Text('Option 1'),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'Option 2',
                                  child: Text('Option 2'),
                                ),
                              ];
                            },
                          ),
                        ),


                      ],
                    ),
    SizedBox(height: 15.sp,),
    BlocBuilder<LocaleCubit, bool?>(
  builder: (context, lState) {
    return Padding(
      padding:  EdgeInsets.only(left: lState==true?10.0:0,right: lState==false?10:0),
      child: Align(
          alignment: lState==true? Alignment.centerLeft:Alignment.centerRight,
          child: AppText('Details'.tr(), style: Styles.openSansStdBold(context,fontSize: 28.sp))),
    );
  },
)
                  ],),
  ),
),

          Expanded(
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                AppColors.lightBrownColor, // Replace this with your desired background color
                BlendMode.softLight, // Use BlendMode.srcIn to replace the image's color

              ),
child: CachedImage(url: pd.image.toString(),isCircle: false,height: 1.sh/2,width: 1.sw,)
              // child: Container(
              //   height: 1.sh/2,
              //
              //   decoration: BoxDecoration(image: DecorationImage(
              //
              //     image: CachedNetworkImageProvider(pd.image.toString()),
              //     fit: BoxFit.fill,
              //
              //   )),
              //
              // ),
            ),
          ),
          ///price
          Expanded(
            flex: 0,
            child: Padding(
              padding:  EdgeInsets.only(left: 10.0.sp),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: AppText("${pd.price} AED", style: Styles.openSansStdBold(context,fontSize: 28.sp,color: AppColors.blackColor))),
            ),
          ),
          ValueListenableBuilder(
            builder: (context,state,ch) {
              return AnimatedContainer(duration: const Duration(milliseconds: 500)

                  ,
                height: state==false?1.sh-(1.sh/2)-(1.sh/4.5):1.sh-(1.sh/2)-(1.sh/8.5),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,

                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r))

                ),
child: Column(
  children: [
    GestureDetector(

      onTap: (){
        if(state==false) {
          HeightNotifier.hNotifier.value=true;
        }
        else{
          HeightNotifier.hNotifier.value=false;
        }
      },
      behavior: HitTestBehavior.opaque,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Align(child: state==false?SvgPicture.asset(Assets.arrowUpIcon): SvgPicture.asset(Assets.arrowDownIcon)),
      ),
    ),
    Row(
      children: <Widget>[
        SizedBox(width: 10.sp,),

        GestureDetector(
          onTap: ()
          {
            //Navigate.pop(context);

          },
          child:   Container(
            width: 40.w,
            height: 40.h,
            margin: EdgeInsets.symmetric(horizontal: 10.sp),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x0A000000),
                  blurRadius: 48,
                  offset: Offset(0, 2),
                  spreadRadius: 2,
                )
              ],
            ),
            child: Material(
              elevation: 4, // Adjust the elevation value as needed
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Optional: Add rounded corners
              ),

              child: Container(
                width: 40.w,
                height: 40.h,
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 48,
                      offset: Offset(0, 2),
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Center(child: SvgPicture.asset(Assets.shareIcon,height: 20,width: 20,)),
              ),
            ),
          ),
        ),
      //  const Spacer(),
        Expanded(child: CustomButton(onTap: (){}, text: 'Order Now',horizontalMargin: 20,borderRadius: 40.r,textFontWeight: FontWeight.bold,textSize: 15,))


      ],
    ),
    SizedBox(height: 20.sp,),
    BlocBuilder<LocaleCubit, bool?>(
  builder: (context, lState) {
    return Padding(
      padding:  EdgeInsets.only(left: lState==true?18.0:0,right: lState==false?18:0),
      child: Align(
          alignment: lState==true? Alignment.centerLeft:Alignment.centerRight,
          child: AppText('Description'.tr(), style: Styles.openSansRegular(context,fontSize: 15.sp,color: AppColors.blackColor,fontStyle: FontStyle.italic))),
    );
  },
),
   SizedBox(height: 20.sp,),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AppText(pd.description.toString(), style: Styles.openSansRegular(context,fontSize: 13.sp,color: AppColors.blackColor),maxLine: state==false?4:6,)),
      ),
    ),
   state==true? Expanded(
     child: SingleChildScrollView(
       physics: const NeverScrollableScrollPhysics(),
       child: Container(
          width: 373,
          height: 98,
          decoration: ShapeDecoration(
            color: const Color(0xFFF1F1F1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
         child: Column(children: [
           SizedBox(height: 10.sp,),
           BlocBuilder<LocaleCubit, bool?>(
  builder: (context, lState) {
    return Padding(
      padding:  EdgeInsets.only(left: lState==true?8.0:0,right: lState==false?8:0),
      child: Align(
          alignment: lState==true? Alignment.centerLeft:Alignment.centerRight,
                 child: AppText('${'Reviews'.tr()} (${pd.rating!.count!})', style: Styles.openSansStdMedium(context,color: AppColors.blackColor,fontSize: 20.sp))),
           );
  },
)
,
        //   SizedBox(height: 15.sp,),
           Row(
             //mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               SizedBox(width: 20.sp,),
               Padding(
                 padding: const EdgeInsets.only(left: 8.0),
                 child: Align(
                     alignment: Alignment.centerLeft,
                     child: AppText(pd.rating!.rate!.toString(), style: Styles.openSansStdBold(context,color: AppColors.blackColor,fontSize: 20.sp))),
               ),
               SizedBox(width: 20.sp,),
               CustomRating(onRatingUpdate: (d){},itemSize: 30,initialRating: pd.rating?.rate??5,iconSize: 2.sp,iconsPaddingHorizontal: 0,),
             ],
           )

         ],),
        ),
     ),
   ):const SizedBox()

                    ],
),
              );
            }, valueListenable: HeightNotifier.hNotifier,
          )



        ],),
      ),

    );
  }
}
