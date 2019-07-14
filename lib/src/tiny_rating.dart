import 'package:flutter/material.dart';

class TinyRating extends StatelessWidget {
  /// No. of stars to View,
  /// Defaults to: 5
  final int starCount;

  /// Actual Rating Value, this may accept half stars,
  /// Required Double.
  final double rating;

  /// This CallBack is called once user changes,
  /// Required if this Rating clickable/changeable.
  final Function onRatingChanged;

  /// this color is given to Selected [Icon],
  /// Defaults to: Theme.of(context).primaryColor.
  final Color selectedColor;

  /// Color is given to unSelected [Icon],
  /// Defaults to: Theme.of(context).primaryColor.
  final Color unSelectedColor;

  /// Size is given to [Icon] and sets it's size
  /// Defaults to : 24.
  final double starSize;

  /// allow eaten/half Stars, 0.50 - 0.99 in considered half star
  /// Defaults to : true.
  final bool allowHalfRating;

  /// spacing between Stars, this is given to [Wrap],
  /// Defaults to : 0.0.
  final double spacing;

  /// Color is given to unSelected [Icon],
  /// Defaults to: Colors.transparent.
  final Color backgroundColor;

  /// WrapAlignment of [Wrap] child,
  /// Defaults to : WrapAlignment.start.
  final WrapAlignment wrapAlignment;

  /// Selected rating [IconData],
  /// Defaults to : Icons.star.
  final IconData selectedIcon;

  /// Selected rating [IconData],
  /// Defaults to : star_border.
  final IconData unSelectedIcon;

  /// Half Selected rating [IconData],
  /// Defaults to : star_border.
  final IconData halfSelectedIcon;

  const TinyRating({
    Key key,
    this.starCount = 5,
    @required this.rating,
    this.onRatingChanged,
    this.selectedColor,
    this.unSelectedColor,
    this.starSize = 24.0,
    this.allowHalfRating = true,
    this.spacing = 0.0,
    this.backgroundColor = Colors.transparent,
    this.wrapAlignment = WrapAlignment.start,
    this.selectedIcon = Icons.star,
    this.unSelectedIcon = Icons.star_border,
    this.halfSelectedIcon = Icons.star_half,
  })  : assert(rating != null),
        super(key: key);

  Widget buildStar(BuildContext context, int index) {
    // Star Icon
    Icon icon;

    // if unSelected Stars
    if (index >= rating) {
      icon = Icon(
        unSelectedIcon,
        color: unSelectedColor ?? Theme.of(context).primaryColor,
        size: starSize,
      );
      // if Selected Stars with half Rating
    } else if (index > rating - (allowHalfRating ? 0.5 : 1.0) &&
        index < rating) {
      icon = Icon(
        halfSelectedIcon,
        color: selectedColor ?? Theme.of(context).primaryColor,
        size: starSize,
      );
      // if Selected Star or else ^^
    } else {
      icon = Icon(
        selectedIcon,
        color: selectedColor ?? Theme.of(context).primaryColor,
        size: starSize,
      );
    }

    // Is it view only or changeable
    if (onRatingChanged != null) {
      return GestureDetector(
        // TODO: does this ()=> really necessary here ?
        onTap: () => onRatingChanged(index + 1.0),
        onHorizontalDragUpdate: (dragDetails) {
          RenderBox box = context.findRenderObject();
          var _pos = box.globalToLocal(dragDetails.globalPosition);
          var i = _pos.dx / starSize;
          var rate = allowHalfRating ? i : i.round().toDouble();
          if (rate > starCount) {
            rate = starCount.toDouble();
          }
          if (rate < 0) {
            rate = 0.0;
          }
          onRatingChanged(rate);
        },
        child: icon,
      );
    } else {
      return icon;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: Wrap(
        alignment: wrapAlignment,
        spacing: spacing,
        children: List.generate(
          starCount,
          (index) => buildStar(context, index),
        ),
      ),
    );
  }
}
