import '../../consts/conste.dart';

Widget PositionedStack({
  // top,
  // right,
  // left,
  // bottom,
  widthSize,
  heightSize,
  firstBox,
  secondBox,
  thirdBox,
  fourthBox,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: widthSize,
        height: heightSize,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: firstBox,
        ),
      ),
      Container(
        width: widthSize,
        height: heightSize,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: secondBox,
        ),
      ),
      Container(
        width: widthSize,
        height: heightSize,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: thirdBox,
        ),
      ),
      Container(
        width: widthSize,
        height: heightSize,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: fourthBox,
        ),
      ),
    ],
  );
}
