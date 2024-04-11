import 'package:flutter/material.dart';
import 'package:shopingapp/widgets/appbar_widgets.dart';

class ManageProduct extends StatelessWidget {
  const ManageProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'ManageProduct'),
        leading: const AppBarButton(),
      ),
    );
  }
}
