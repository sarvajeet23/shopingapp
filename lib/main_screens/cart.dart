import 'package:flutter/material.dart';
import 'package:shopingapp/main_screens/customer_home.dart';
import 'package:shopingapp/widgets/appbar_widgets.dart';
import 'package:shopingapp/widgets/yellow_button.dart';

class CartScreen extends StatefulWidget {
  final Widget? back;
  const CartScreen({super.key, this.back});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: widget.back,
            elevation: 0,
            backgroundColor: Colors.white,
            title: const AppBarTitle(title: 'Cart'),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.black,
                  ))
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Your Card is Empty',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 50,
                ),
                Material(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(25),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.6,
                    onPressed: () {
                      Navigator.canPop(context)
                          ? Navigator.pop(context)
                          : Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CustomerHomeScreen(),
                              ));
                    },
                    child: const Text(
                      'continue shopping',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Total: \$ ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '00.00',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  YellowButton(
                    width: 0.45,
                    label: 'CHECK OUT',
                    onPressed: () {},
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
