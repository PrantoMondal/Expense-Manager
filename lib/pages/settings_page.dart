import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = "/settings";
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

bool isSwitched = false;

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () async {},
                    child: Icon(Icons.arrow_back_ios_new_outlined)),
                Text(
                  "Settings",
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CardWithTitleAndIcon(
              title: 'Profile',
              leadingIcon: Icons.person,
              color: Colors.amber,
              onTap: () async {},
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            CardWithTitleAndIcon(
              title: 'Log Out',
              leadingIcon: Icons.logout,
              color: Colors.amber,
              onTap: () async {},
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            CardWithTitleAndIcon(
              title: 'Theme',
              leadingIcon: Icons.notifications,
              color: Colors.blue,
              onTap: () async {},
              trailing: Switch.adaptive(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                activeColor: Colors.blueAccent,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 70.0),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            CardWithTitleAndIcon(
              title: 'Delete Account',
              leadingIcon: Icons.delete,
              color: Colors.red,
              onTap: () async {},
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWithTitleAndIcon extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final Widget trailing;
  final Function() onTap;
  final Color? color;

  CardWithTitleAndIcon({
    required this.title,
    this.color,
    required this.leadingIcon,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: color ?? Colors.blue),
              child: Icon(
                leadingIcon,
                color: Colors.white,
              )),
          title: Text(title),
          trailing: trailing,
        ),
      ),
    );
  }
}
