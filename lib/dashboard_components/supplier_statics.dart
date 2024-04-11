import 'package:flutter/material.dart';
import 'package:shopingapp/widgets/appbar_widgets.dart';

class StaticsScreen extends StatelessWidget {
  const StaticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'StaticsScreen'),
        leading: const AppBarButton(),
      ),
    );
  }
}
