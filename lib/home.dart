import 'package:flutter/material.dart';
import 'package:whatsapp/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var name = [
    'Nikil',
    'Muhaim',
    'Ramees',
    'Nishad',
    'Arshad',
    'Sofvan',
    'Yahya',
    'Anshad',
    'Lionel Messi',
    'Neymar'
  ];
  var images = [
    'assets/images/IMG_4677.JPG',
    'assets/images/wallpaperflare.com_wallpaper.jpg',
    'assets/images/WhatsApp Image 2023-02-08 at 7.20.59 PM.jpeg',
    'assets/images/wp1908590-programing-wallpapers.jpg',
    'assets/images/E3A26B17-652E-46F8-88E4-99387AB9B392.jpeg',
    'assets/images/16854.jpg',
    'assets/images/1234846.jpg',
    'assets/images/1283922.jpg',
    'assets/images/1286765.jpg',
    'assets/images/wp2955940-dc-movies-wallpapers.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Whtasapp'),
        actions: [
          IconButton(
            onPressed: () async {
              var pref = await SharedPreferences.getInstance();
              pref.setBool('isLogged', false);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
              
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: index.isEven
                    ? CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          images[index],
                        ),
                      )
                    : Image(
                        width: 70,
                        image: AssetImage(
                          images[index],
                        ),
                      ),
                title: Text(name[index]),
                subtitle: const Text('you have message'),
                trailing: const Text('5:11 pm'),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 1,
                color: Colors.grey,
              );
            },
            itemCount: name.length),
      ),
    );
  }
}
