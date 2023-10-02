import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:step_up/controller/auth/auth_functions.dart';
import 'package:step_up/util/widgets/circle_widget.dart';

class UserProfileScreen extends StatefulWidget {
  static const rootName = '/UserProfileScreen';
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final providerfunc = Provider.of<AuthFunctions>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              color: Colors.black,
              onPressed: () {
                {}
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          title: const Text(
            'User Profile',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            const Align(
              alignment: Alignment.center,
              child: CircleWiget(
                height: 130,
                width: 130,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'User name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 70,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const ProfileListTileWidget(
                      icon: Ionicons.notifications_outline,
                      title: 'Notifications',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ProfileListTileWidget(
                      icon: Icons.inventory_2_outlined,
                      title: 'Orders',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ProfileListTileWidget(
                      icon: Ionicons.share_social_outline,
                      title: 'Share',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ProfileListTileWidget(
                      icon: Icons.favorite_outline,
                      title: 'Wishlist',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ProfileListTileWidget(
                      icon: Ionicons.settings,
                      title: 'Settings',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () async {
                              await providerfunc.logout(
                                context,
                                mounted,
                              );
                            },
                            icon: const Icon(Icons.logout),
                            label: const Text('Logout'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class ProfileListTileWidget extends StatelessWidget {
  const ProfileListTileWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.green,
          size: 50,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        trailing: IconButton(
          onPressed: () async {},
          icon: const Icon(
            Icons.arrow_forward_outlined,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
