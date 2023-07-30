import '../../consts/conste.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: borderColor, width: 2),
        ),
        primary: backgroundColor,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
        ),
      ),
    );
  }
}

TextField MyTextField({
  keyboardType,
  controller,
  obscureText,
  hintText,
  suffixIcon,
  maxLines,
  readOnly,
}) {
  return TextField(
    readOnly: readOnly,
    keyboardType: keyboardType,
    controller: controller,
    maxLines: maxLines,
    obscureText: obscureText,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.grey.shade200,
      hintText: hintText,
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 1,
          color: whiteColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 1,
          color: Colors.blue,
        ),
      ),
    ),
  );
}

GestureDetector myInterestsChips(
    width, _handleTap, bool isTapped, String textDesc) {
  return GestureDetector(
    onTap: _handleTap,
    child: Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: isTapped ? yalowColor : lightColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isTapped ? yalowColor : blackColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isTapped ? Icons.done : Icons.add,
            color: isTapped ? whiteColor : blackColor,
          ),
          8.widthBox,
          textDesc.text.medium
              .size(12)
              .color(
                isTapped ? whiteColor : blackColor,
              )
              .make(),
        ],
      ),
    ),
  );
}
