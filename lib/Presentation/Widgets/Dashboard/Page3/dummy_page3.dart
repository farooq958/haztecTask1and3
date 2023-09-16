import 'package:taskhaztec/Data/DataSource/Resources/imports.dart';

class DummyPage3 extends StatelessWidget {
  const DummyPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SizedBox(

        width: 1.sw,
        height: 1.sh,
        child: Center(child: AppText('Dummy Page3', style: Styles.openSansStdBold(context,color: AppColors.darkBrownColor))),

      ),

    );
  }
}
