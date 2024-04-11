import 'package:flutter/material.dart';
import 'package:shopingapp/categories/accessories_categ.dart';
import 'package:shopingapp/categories/bags_categ.dart';
import 'package:shopingapp/categories/beauty_categ.dart';
import 'package:shopingapp/categories/electronics.dart';
import 'package:shopingapp/categories/home_garden.dart';
import 'package:shopingapp/categories/kids_categ.dart';
import 'package:shopingapp/categories/men_categ.dart';
import 'package:shopingapp/categories/shoes_categ.dart';
import 'package:shopingapp/categories/women_categ.dart';

import 'package:shopingapp/widgets/fake_search.dart';

List<ItemsData> items = [
  ItemsData(lable: 'men'),
  ItemsData(lable: 'women'),
  ItemsData(lable: 'shoes'),
  ItemsData(lable: 'bags'),
  ItemsData(lable: 'electronics'),
  ItemsData(lable: 'accessories'),
  ItemsData(lable: 'home & garden'),
  ItemsData(lable: 'kids'),
  ItemsData(lable: 'beauty'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    for (var element in items) {
      element.isselected = false;
    }
    setState(() {
      items[0].isselected = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const FakeSearch(),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: sideNavigator(size),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: categView(size),
          ),
        ],
      ),
    );
  }

  Widget sideNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceInOut);
                /* for (var element in items) {
                  element.isselected = false;
                }
                setState(() {
                  items[index].isselected = true;
                });*/
              },
              child: Container(
                color: items[index].isselected == true
                    ? Colors.white
                    : Colors.grey.shade300,
                height: 100,
                child: Center(
                  child: Text(items[index].lable),
                ),
              ),
            );
          }),
    );
  }

  Widget categView(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          for (var element in items) {
            element.isselected = false;
          }
          setState(() {
            items[value].isselected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: const [
          MenCategory(),
          WomenCategory(),
          ShoesCategory(),
          BagsCategory(),
          ElectronicsCategory(),
          AccessoriesCategory(),
          KidsCategory(),
          HomeGardenCategory(),
          BeautyCategory(),
        ],
      ),
    );
  }
}

class ItemsData {
  String lable;
  bool isselected;
  ItemsData({required this.lable, this.isselected = false});
}
