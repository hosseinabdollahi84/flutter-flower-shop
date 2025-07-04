import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            // profile image..................
            Container(
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor.withOpacity(0.5),
                ),
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage(
                  'assets/images/profilee.jpg',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //profile name..............
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'هرمیون گرنجر',
                  style: TextStyle(
                      color: Constants.blackColors,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'iransans'),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset('assets/images/verified.png'),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            Text(
              'Emai2134zd@gmail.com',
              style: TextStyle(
                color: Constants.blackColors.withOpacity(0.5),
                fontSize: 14,
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            //profile Options..................
            const SizedBox(
              child: Column(
                children: [
                  // back icon.................
                  Options(
                    title: 'پروفایل من',
                    icon: Icons.person,
                  ),
                  Options(
                    title: 'تنظیمات',
                    icon: Icons.settings,
                  ),
                  Options(
                    title: 'اطلاع رسانی‌ها',
                    icon: Icons.share,
                  ),
                  Options(
                    title: 'شبکه‌های اجتماعی',
                    icon: Icons.sms_rounded,
                  ),
                  Options(
                    title: 'خروج',
                    icon: Icons.logout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Options extends StatelessWidget {
  final IconData icon;
  final String title;
  const Options({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: Constants.blackColors,
          ),
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'iransans',
                    color: Constants.blackColors),
              ),
              const SizedBox(
                width: 6,
              ),
              Icon(
                icon,
                color: Constants.blackColors.withOpacity(0.5),
                size: 23,
              )
            ],
          )
        ],
      ),
    );
  }
}
