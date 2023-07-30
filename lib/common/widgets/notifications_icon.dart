
import '../../consts/conste.dart';
import '../../features/home_page/screens/Notifications/notifications_screen.dart';

class NotificationsIcon extends StatelessWidget {
  final int notificationCount;

  const NotificationsIcon({required this.notificationCount, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => NotificationsScreen(),
            transition: Transition.rightToLeft,
          );
        },
        child: Stack(
          children: [
            Icon(
              Icons.notifications_outlined,
              size: 30,
            ),
            if (notificationCount > 0)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '$notificationCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
