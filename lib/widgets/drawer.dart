import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/utiils/routes.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
final imageUrl = "https://scontent.fktm9-2.fna.fbcdn.net/v/t1.6435-9/71119188_894678417570541_1688713679735881728_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=174925&_nc_ohc=tAwXdCsEHBwAX-rMG9i&_nc_ht=scontent.fktm9-2.fna&oh=00_AT_H5dg4fTP01L-kJDicB1-TKb1sgf7eSzd2BeAA086CWA&oe=621B19F7";
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children:  [
            DrawerHeader(
              padding: EdgeInsets.zero,
                      child: UserAccountsDrawerHeader(
                        margin: EdgeInsets.zero,

                        accountName: Text('Rafik ali') ,
                        accountEmail: Text("ra3210304@gmail.com"),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: NetworkImage(imageUrl),
                        )
                      ),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.home,
              color: Colors.white),
              title: Text("Home",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              )),
            ),
                const ListTile(
              leading: Icon(CupertinoIcons.profile_circled,
              color: Colors.white),
              title: Text("Profile",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              )),

            ),
             ListTile(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.loginRoute);
              },
              leading: Icon(CupertinoIcons.mail,
              color: Colors.white),
              title: const Text("Email",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              )),

            ),


          ]
                ),
      ),
      );

  }
}
