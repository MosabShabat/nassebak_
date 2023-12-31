
import '../../consts/conste.dart';

Widget ourButton({onPress, color, textColor, String? title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        primary: color,
      ),
      onPressed: onPress,
      child: title!.text.color(textColor).fontFamily(bold).make());
}
