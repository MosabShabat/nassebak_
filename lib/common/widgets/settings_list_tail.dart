import 'package:flutter_svg/svg.dart';

import '../../consts/conste.dart';

class settingsListTail extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPressed;
  final Color containerColor;
  final Color iconColor;
  final Color titleColor;

  const settingsListTail({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    required this.containerColor,
    required this.iconColor, required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        width: 50,
        height: 50,
        child: Center(
          child: SvgPicture.asset(icon),
        ),
      ),
      title: title.text.medium.color(titleColor).size(16).make(),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: blackColor,
      ),
    );
  }
}
