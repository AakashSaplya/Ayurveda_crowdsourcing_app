import 'package:ayurveda/Home/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Drawer(
      width: screenwidth * 0.80,
      backgroundColor: Colors.grey[200],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: screenheight * 0.120,
            child: const DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Center(
                child: Text(
                  'My Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child:
                    const Image(image: AssetImage("assets/silicon_valley.jpg")),
              )),
          const SizedBox(height: 10),
          Center(
              child:
                  Text("Name", style: Theme.of(context).textTheme.headline5)),
          Center(
            child: Text("Email: ${user.email!}",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.apply(fontSizeFactor: 1.5)),
          ),
          const SizedBox(height: 10),
          SizedBox(
              width: screenwidth * 0.50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade600,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text("Edit Profile",
                    style: TextStyle(color: Colors.white)),
              )),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 5),
          ProfileMenuWidget(
              title: "Settings", icon: Icons.settings_outlined, onPress: () {}),
          ProfileMenuWidget(
              title: "Information", icon: Icons.info_sharp, onPress: () {}),
          ProfileMenuWidget(title: "Help", icon: Icons.help, onPress: () {}),
          ProfileMenuWidget(
              title: "Privacy & Policy",
              icon: Icons.privacy_tip,
              onPress: () {}),
          ProfileMenuWidget(
              title: "Logout",
              icon: Icons.logout_outlined,
              textColor: Colors.red.shade600,
              endIcon: false,
              onPress: () {
                FirebaseAuth.instance.signOut();
              }),
          // ListTile(
          //   title: const Text('Item 1'),
          //   onTap: () {
          //     // Update the state of the app
          //     // ...
          //     // Then close the drawer
          //     Navigator.pop(context);
          //   },
          // ),
          // ListTile(
          //   title: const Text('Item 2'),
          //   onTap: () {
          //     // Update the state of the app
          //     // ...
          //     // Then close the drawer
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }
}
