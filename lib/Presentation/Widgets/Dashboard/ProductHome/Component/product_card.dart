import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:taskhaztec/Data/DataSource/Resources/imports.dart';
import 'package:taskhaztec/Domain/Models/ProductModels/product_model.dart';
import 'package:taskhaztec/Presentation/Common/custom_rating_bar.dart';
import 'package:taskhaztec/Presentation/Widgets/locale_cubit.dart';

class ProductCard extends StatelessWidget {

  final ProductModel pd;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.pd, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: 362.w,
        height: 309.h,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(),
        child: Column(

          children: [
Container(
  width: 362.w,
  height: 216.08.h,
  decoration: ShapeDecoration(
      image: DecorationImage(
        image: CachedNetworkImageProvider(pd.image.toString()),
        fit: BoxFit.fill,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),

  ),
child: Column(
  children: <Widget>[
      const Spacer(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
        child: Row(
   //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                     SizedBox(width: 20.sp,),
                        Material(

                            color: AppColors.lightGreyColor.withOpacity(0.4),
                            child: AppText(pd.price.toString(), style: Styles.openSansStdBold(context,fontSize: 16.sp))),
                        Material(
                            color: AppColors.lightGreyColor.withOpacity(0.4),
                            child: AppText('AED', style: Styles.openSansStdBold(context,fontSize: 16.sp))),

                        const Spacer(),
CustomRating(onRatingUpdate: (d){},initialRating: pd.rating?.rate??5,iconSize: 2.sp,iconsPaddingHorizontal: 0,)


                      ],
                    ),
      ),
                ],
),

),
            BlocBuilder<LocaleCubit, bool?>(
  builder: (context, lState) {
    return Padding(
              padding:  EdgeInsets.only(left: lState==true?18.0:0,right: lState==false?18:0),
              child: Align(
                alignment: lState==true? Alignment.centerLeft:Alignment.centerRight,
                  child: AppText('Product Name'.tr(), style: Styles.openSansRegular(context,fontSize: 15.sp,color: AppColors.blackColor,fontStyle: FontStyle.italic))),
            );
  },
),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: AppText(pd.title.toString(),
              //  textAlign: TextAlign.left,
                style: Styles.openSansRegular(context,fontSize: 13.sp,color: AppColors.blackColor),maxLine: 2,),
            ),




          ],

        ),


      ),
    );
  }
}
