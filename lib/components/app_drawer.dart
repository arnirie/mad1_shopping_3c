import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad1_shopping_3c/screens/product_listing.dart';
import 'package:mad1_shopping_3c/screens/product_manage.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Text(
                'Shopping 3C',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushReplacement(
              CupertinoPageRoute(
                builder: (_) => ProductListingScreen(),
              ),
            ),
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          const ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushReplacement(
              CupertinoPageRoute(
                builder: (_) => ProductManageScreen(),
              ),
            ),
            leading: Icon(Icons.grid_view),
            title: Text('Products'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Account'),
          ),
        ],
      ),
    );
  }
}
