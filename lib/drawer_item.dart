import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Align(
              alignment:
                  Alignment.topRight, //aligns CircleAvatar to Top Center.
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'Nahid Hasan',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    child: CircleAvatar(
                      radius: 50, //radius is 50
                      backgroundImage: NetworkImage(
                          'https://usaupload.com/cache/plugins/filepreviewer/82268/b19365cc5cfb232e16b6c1e928b6ef348ed8b0387f2a416b69d29b7afce3af93/280x280_middle.jpg'), //image url
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("Add"),
            trailing: Icon(Icons.add),
            subtitle: Text('Add your thinking'),
            onTap: () {},
          ),
          ListTile(
            title: Text("Category"),
            trailing: Icon(Icons.category),
            subtitle: Text('Add your category'),
            onTap: () {},
          ),
          ListTile(
            title: Text("Settings"),
            trailing: Icon(Icons.settings),
            subtitle: Text('Change your Settings'),
            onTap: () {},
          ),
          ListTile(
            title: Text("Description"),
            trailing: Icon(Icons.description),
            subtitle: Text('Bellow description'),
            onTap: () {},
          ),
          ListTile(
            title: Text("Email"),
            trailing: Icon(Icons.email),
            subtitle: Text('Add your email'),
            onTap: () {},
          ),
        ],
      ),
    );
    ;
  }
}
