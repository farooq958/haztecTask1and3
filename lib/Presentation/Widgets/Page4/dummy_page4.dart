import 'package:taskhaztec/Data/DataSource/Resources/imports.dart';

class DummyPage4 extends StatelessWidget {
  const DummyPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SizedBox(

        width: 1.sw,
        height: 1.sh,
        child: Center(child: AppText('Dummy Page4', style: Styles.openSansStdBold(context,color: AppColors.darkPrimaryColor))),

      ),

    );
  }
}
