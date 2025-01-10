import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // ignore: non_constant_identifier_names
  MySnackBar(Message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(Message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello world"),
        backgroundColor: Colors.amber,
        centerTitle: true,
        titleSpacing: 10,
        //toolbarHeight: 60,
        //toolbarOpacity: 1,
        //titleTextStyle: ,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.amber),
                accountName: Text("Takbirul islam"),
                accountEmail: Text("Takbir@gmail.com"),
              ),
            ),
            // DrawerHeader(
            //       padding: const EdgeInsets.all(0),
            //       child: UserAccountsDrawerHeader(
            //         decoration: const BoxDecoration(color: Colors.amber),
            //         accountName: const Text("Takbirul islam"),
            //         accountEmail: const Text("Takbirulislam06@gmail.com"),
            //         currentAccountPicture:
            //             Image.network("https://rabbil.com/files/rabbilVai.png"),
            //       )),
            // DrawerHeader(child: Text("Takbirul islam")),
            ListTile(
              title: const Text("Home"),
              leading: const Icon(Icons.home),
              onTap: () {
                MySnackBar("Home", context);
              },
            ),
            ListTile(
              title: const Text("contact us"),
              leading: const Icon(Icons.contact_mail_rounded),
              onTap: () {
                MySnackBar("contact us", context);
              },
            )
          ],
        ),
      ),
    );
  }
}
