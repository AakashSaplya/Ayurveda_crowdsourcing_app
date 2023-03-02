import 'package:ayurveda/Home/drawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance.currentUser!;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.green[500],
      ),
      drawer: const DrawerPage(),
      body: SingleChildScrollView(
        child: Container(
          height: screenheight * 100.0,
          color: Colors.grey[200],
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                        image: AssetImage("assets/silicon_valley.jpg")),
                  )),
              const SizedBox(height: 10),
              Text("Name", style: Theme.of(context).textTheme.headline4),
              Text("Email: " + user.email!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.apply(fontSizeFactor: 1.5)),
              const SizedBox(height: 20),
              SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Edit Profile",
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade600,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                  )),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Settings",
                  icon: Icons.settings_outlined,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Information", icon: Icons.info_sharp, onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.logout_outlined,
                  textColor: Colors.red.shade600,
                  endIcon: false,
                  onPress: () {
                    FirebaseAuth.instance.signOut();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.greenAccent.withOpacity(0.1)),
        child: Icon(icon, color: Colors.teal.shade800),
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.apply(color: textColor, fontSizeFactor: 1.3),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blueGrey.withOpacity(0.1)),
              child: const Icon(Icons.arrow_forward_ios,
                  size: 18.0, color: Colors.grey),
            )
          : null,
    );
  }
}
