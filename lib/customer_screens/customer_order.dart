import 'package:flutter/material.dart';
import 'package:shopingapp/widgets/appbar_widgets.dart';

class CustomerOrder extends StatelessWidget {
  const CustomerOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'CustomerOrder'),
        leading: const AppBarButton(),
      ),
    );
  }
}
