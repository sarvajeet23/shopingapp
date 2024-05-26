import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:shopingapp/customer_screens/customer_order.dart';
import 'package:shopingapp/customer_screens/wishlist.dart';
import 'package:shopingapp/main_screens/cart.dart';
import 'package:shopingapp/widgets/alert_dialog.dart';
import 'package:shopingapp/widgets/appbar_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(children: [
        Container(
          height: 230,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.yellow,
              Colors.brown,
            ],
          )),
        ),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              centerTitle: true,
              pinned: true,
              elevation: 0,
              expandedHeight: 140,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  return FlexibleSpaceBar(
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: constraints.biggest.height <= 120 ? 1 : 0,
                      child: const Text(
                        'Account',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    background: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.yellow,
                            Colors.brown,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25, left: 30),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('images/inapp/guest.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text(
                                'guest'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CartScreen(
                                            back: AppBarButton(),
                                          )));
                            },
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: const Center(
                                child: Text(
                                  'Cart',
                                  style: TextStyle(color: Colors.yellow, fontSize: 20),
                                ),
                              ),
                            )),
                      ),
                      Container(
                        color: Colors.yellow,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CustomerOrder()));
                            },
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: const Center(
                                child: Text(
                                  'Order',
                                  style: TextStyle(color: Colors.black54, fontSize: 20),
                                ),
                              ),
                            )),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const WishlistScreen()));
                            },
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: const Center(
                                child: Text(
                                  'Wishlist',
                                  style: TextStyle(color: Colors.yellow, fontSize: 20),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade300,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 150,
                        child: Image(image: AssetImage('images/inapp/logo.jpg')),
                      ),
                      const ProfileHeaderLabel(
                        headerLabel: '  Account Info  ',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 260,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: const Column(
                            children: [
                              RepeatedListTile(
                                title: 'Email Address',
                                subtitle: 'exemple@email.com',
                                icon: Icons.email,
                              ),
                              YellowDivider(),
                              RepeatedListTile(
                                title: 'Phone No',
                                subtitle: '+91-7903329530',
                                icon: Icons.phone,
                              ),
                              YellowDivider(),
                              RepeatedListTile(
                                title: 'Address',
                                subtitle: 'patna,Bihar',
                                icon: Icons.location_pin,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const ProfileHeaderLabel(headerLabel: '  Account Setting  '),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 260,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              RepeatedListTile(
                                  title: 'Edit Profile',
                                  subtitle: '',
                                  icon: Icons.edit,
                                  onpressed: () {}),
                              const YellowDivider(),
                              RepeatedListTile(
                                  title: 'Change Password',
                                  icon: Icons.lock,
                                  onpressed: () {}),
                              const YellowDivider(),
                              RepeatedListTile(
                                title: 'Logout',
                                icon: Icons.logout,
                                onpressed: () async {
                                  MyAlertDilaog.showMyDiloag(
                                      context: context,
                                      title: 'Log out',
                                      content: 'Are your sure to log out?',
                                      tabNo: () {
                                        Navigator.pop(context);
                                      },
                                      tabYes: () async {
                                        await FirebaseAuth.instance.signOut();

                                        if (!context.mounted) return;

                                        Navigator.pop(context);
                                        Navigator.pushReplacementNamed(
                                            context, '/welcome_screen');
                                      });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ]),
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.yellow,
        thickness: 1,
      ),
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function()? onpressed;
  const RepeatedListTile(
      {super.key,
      required this.title,
      required this.icon,
      this.onpressed,
      this.subtitle = ''});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(icon),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const ProfileHeaderLabel({super.key, required this.headerLabel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Text(
            headerLabel,
            style: const TextStyle(
                color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
