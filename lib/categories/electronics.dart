import 'package:flutter/material.dart';
import 'package:shopingapp/utilites/categ_list.dart';
import 'package:shopingapp/widgets/categ_widgets.dart';

class ElectronicsCategory extends StatelessWidget {
  const ElectronicsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CategHeaderLabel(headerLabel: 'electronics'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: GridView.count(
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 15,
                    crossAxisCount: 3,
                    children: List.generate(electronics.length, (index) {
                      return SubcategModel(
                        assetName: 'images/electronics/electronics$index.jpg',
                        mainCategName: 'electronics',
                        subCategName: electronics[index],
                        subCategLabel: electronics[index],
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
        const Positioned(
            bottom: 0,
            right: 0,
            child: SliderBar(
              maincategName: 'electronics',
            ))
      ]),
    );
  }
}
