import 'package:flutter/material.dart';
import 'package:shopingapp/dashboard_components/edit_bussiness.dart';
import 'package:shopingapp/dashboard_components/manage_product.dart';
import 'package:shopingapp/dashboard_components/my_store.dart';
import 'package:shopingapp/dashboard_components/supplier_balance.dart';
import 'package:shopingapp/dashboard_components/supplier_order.dart';
import 'package:shopingapp/dashboard_components/supplier_statics.dart';
import 'package:shopingapp/widgets/appbar_widgets.dart';

List<String> label = [
  'my store',
  'order',
  'edit profile',
  'manage products',
  'blance',
  'statics'
];

List<IconData> icons = [
  Icons.store,
  Icons.shop_2,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart,
];

List<Widget> pages = const [
  MyStore(),
  SupplierOrder(),
  EditBussiness(),
  ManageProduct(),
  BalanceScreen(),
  StaticsScreen()
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(
          title: 'Dashboard',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/welcome_screen');
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          children: [
            ...List.generate(6, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pages[index]),
                  );
                },
                child: Card(
                  elevation: 20,
                  shadowColor: Colors.purpleAccent.shade200,
                  color: Colors.blueGrey.withOpacity(0.7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        icons[index],
                        size: 50,
                        color: Colors.yellowAccent,
                      ),
                      Text(
                        label[index].toUpperCase(),
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Acme'),
                      )
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
