import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 248, 246, 246),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40, // Adjust the radius to your desired size
                  backgroundImage: AssetImage("assets/images/girl1.jpg"),
                ),
                // Add any other widgets you want to include in the Row here.
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Mwashe Berit"), Text('mwasheb@gmail.com')],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                '/',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                '/allProductScreen',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Categories'),
            onTap: () {
             Navigator.pushReplacementNamed(
                context,
                '/categoriesScreen',arguments:"Categories Screen"
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Waridi Kiosk Vendors'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                '/vendors'
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Sign In'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                '/login',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
            Navigator.pushNamed(
                context,
                '/notifications',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('Blogs'),
            onTap: () {
              // Handle Blogs onTap
               Navigator.pushNamed(
                context,
                '/blogs',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle Settings onTap
             
               Navigator.pushNamed(
                context,
                '/settingsScreen',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle Logout onTap
            },
          ),
          ListTile(
            leading: Icon(Icons.ads_click_outlined),
            title: Text('Feeds'),
            onTap: () {
              // Handle Logout onTap
               Navigator.pushReplacementNamed(
                context,
                '/feedScreen',
              );
             
            },
          ),
        ],
      ),
    );
  }
}
