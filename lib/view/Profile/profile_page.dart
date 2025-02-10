import 'package:flutter/material.dart';
import 'package:app/widget/bottomNavbar.dart';

class ProfileContainer extends StatefulWidget {
  const ProfileContainer({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profile', style: TextStyle(fontSize: 20)),
            Text('Express yourself!✨',
                style: TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_1.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(),
            ),
            SizedBox(height: 10),
            Text(
              '@johndoe',
              style: TextStyle(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'IT Developer | Dog Lover',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text('Email'),
                    subtitle: Text('johndoe@example.com'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Phone'),
                    subtitle: Text('08799979799'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Location'),
                    subtitle: Text('Tangerang, Indonesia'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
