

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taskhaztec/Data/DataSource/Resources/imports.dart';

class CustomRating extends StatelessWidget {
  const CustomRating(
      {this.initialRating = 3,
      this.minRating = 1,
      this.iconSize = 10,
      this.iconsPaddingHorizontal = 2,
      this.icon = Icons.star,
      this.iconColor = Colors.amber,
      this.titleTextColor = AppColors.blackColor,
      this.titleText,
      required this.onRatingUpdate,
      Key? key, this.itemSize})
      : super(key: key);
  final void Function(double) onRatingUpdate;
  final double initialRating;
  final double minRating;
  final double iconSize;
  final double? itemSize;
  final double iconsPaddingHorizontal;
  final IconData icon;
  final Color iconColor;
  final Color? titleTextColor;
  final String? titleText;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: minRating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: itemSize??20,
      itemPadding:
          EdgeInsets.symmetric(horizontal: iconsPaddingHorizontal),
      itemBuilder: (context, _) => Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
