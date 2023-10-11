import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_up/controller/providers/theme_provider.dart';
import 'package:step_up/controller/providers/user_provider.dart';
import 'package:step_up/model/user_model.dart';
import 'package:step_up/services/app_function/error_warning_dialog.dart';
import 'package:step_up/services/asset_manager.dart';
import 'package:step_up/services/image_picker_function.dart';
import 'package:step_up/util/widgets/subtitle_widget.dart';

class MyAppDrawer extends StatefulWidget {
  MyAppDrawer({super.key});

  @override
  State<MyAppDrawer> createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel? userModel;

  Future<void> fetchUserInfo() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      setState(() {});
      userModel = await userProvider.fetchUserInfo();
    } catch (error) {
      if (!context.mounted) return;
      await WarningErrorDialog.showErrorOrWarningDialog(
          context: context,
          subtitle: error.toString(),
          fct: () {},
          btnText: 'Back');
    } finally {
      setState(() {});
    }
    // print('user name : ${userModel!.userName}');
    // // print('user name : ${userModel!.userEmail}');
  }

  @override
  void initState() {
    fetchUserInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: DrawerHeader(
              child: Column(
                children: [
                  Container(
                    width: size.height * 0.11,
                    height: size.height * 0.11,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.background,
                          width: 3),
                      image: DecorationImage(
                        image: NetworkImage(userModel!.userImage),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SubTitleWidget(
                    fontSize: 18,
                    text: userModel!.userName,
                    fontWeight: FontWeight.bold,
                  ),
                  SubTitleWidget(
                    fontSize: 16,
                    text: userModel!.userEmail,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: themeProvider.getIsDarkTheme
                ? Image.asset(
                    AssetManageer.light,
                    height: 35,
                  )
                : Image.asset(
                    AssetManageer.dark,
                    height: 35,
                  ),
            title: Text(
              themeProvider.getIsDarkTheme ? 'Dark Mode' : 'Light Mode',
              style: const TextStyle(fontSize: 18),
            ),
            trailing: Switch(
                value: themeProvider.getIsDarkTheme,
                onChanged: (value) {
                  themeProvider.setDarkTheme(value);
                }),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Image.asset(AssetManageer.about, height: 35),
              title: const Text(
                'About us',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Image.asset(
                AssetManageer.orders,
                height: 35,
              ),
              title: const Text(
                'My Orders',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Image.asset(
                AssetManageer.wishlist,
                height: 35,
              ),
              title: const Text(
                'Wishlist',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Image.asset(
                AssetManageer.terms,
                height: 35,
              ),
              title: const Text(
                'Terms & Conditions',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
