import 'package:taskhaztec/Application/Services/Navigation/navigation.dart';
import 'package:taskhaztec/Data/DataSource/Resources/imports.dart';
import 'package:taskhaztec/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:taskhaztec/Presentation/Common/widget_functions.dart';
import 'package:taskhaztec/Presentation/Widgets/Dashboard/ProductDetail/Controller/Notifier/height_notifier.dart';
import 'package:taskhaztec/Presentation/Widgets/Dashboard/ProductDetail/product_detail.dart';
import 'package:taskhaztec/Presentation/Widgets/Dashboard/ProductHome/Component/CustomAppBar/cutom_product_app_bar.dart';
import 'package:taskhaztec/Presentation/Widgets/Dashboard/ProductHome/Component/product_card.dart';
import 'package:taskhaztec/Presentation/Widgets/Dashboard/ProductHome/Controller/product_cubit.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  @override
  void initState() {
    context.read<ProductCubit>().getAllProducts();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.allProducts,),


      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocConsumer<ProductCubit, ProductState>(
              listener: (context, state) {
                // TODO: implement listener
                if(state is ProductError)
                  {
                    WidgetFunctions.instance.snackBar(context,text: state.error,);
                  }
              },
              builder: (context, state) {
                if(state is ProductSuccess) {
                  return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {

                    return ProductCard(pd: state.productDto[index],onTap: (){
                   //   print(state.productDto[index].price);
Navigate.to(context, ProductDetail(pd: state.productDto[index]));
HeightNotifier.hNotifier.value=false;


                    },);

                  },
                    separatorBuilder: (context, index) {
                      return 10.y;
                    },
                    itemCount
                    :state.productDto.length);
                }
                else if(state is ProductLoading)
                  {
                    return SizedBox(
                        width: 1.sw,
                        height: 1.sh,

                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 38.0),
                          child: Center(child: LoadingDialog.loadingWidget()),
                        ));

                  }
                else if(state is ProductError)
                  {
                    return SizedBox(
                        width: 1.sw,
                        height: 1.sh,
                        child: Center(child: AppText('Something Went Wrong',style: Styles.openSansStdBold(context,color: AppColors.blackColor),)));
                  }
                else
                  {

                    return const SizedBox();
                  }
              },
            )



          ],

        ),
      ),

    );
  }
}
