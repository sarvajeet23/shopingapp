import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Acme',
            fontSize: 24,
            letterSpacing: 1.5),
      ),
    );
  }
}
