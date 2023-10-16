import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plant_app/model/plant_model.dart';

import '../utils/base_color.dart';

class DetailedScreen extends StatelessWidget {
  final PlantModel plantModel;
  final String index;
  const DetailedScreen(
      {super.key, required this.plantModel, required this.index});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
        backgroundColor: BaseColor.grey2,
        leadingWidth: 58,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.045),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: BaseColor.grey2,
          child: Column(
            children: [
              /// plant image
              SizedBox(
                height: height * 0.4,
                child: Hero(
                  tag: index,
                  child: Image.asset(
                    plantModel.image.toString(),
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              /// plant title
              TitleWidget(
                width: width,
                title: plantModel.name.toString(),
              ),

              SizedBox(
                height: height * 0.025,
              ),

              /// plant description
              DescriptionWidget(
                width: width,
                description: plantModel.description.toString(),
              ),

              const Spacer(),

              /// footer
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
                child: Container(
                  height: height * 0.3,
                  width: double.infinity,
                  color: BaseColor.green,
                  padding: EdgeInsets.only(
                    left: width * 0.08,
                    right: width * 0.08,
                    top: height * 0.04,
                    bottom: height * 0.03,
                  ),
                  child: Column(
                    children: [
                      /// height, temp, pot
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.height,
                                size: 40,
                                color: BaseColor.white,
                              ),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              Text(
                                "Height",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: BaseColor.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                maxLines: 1,
                              ),
                              Text(
                                plantModel.height.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: BaseColor.backgroundWhite,
                                      fontSize: 14,
                                    ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.temperatureEmpty,
                                size: 35,
                                color: BaseColor.white,
                              ),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              Text(
                                "Temparature",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: BaseColor.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                maxLines: 1,
                              ),
                              Text(
                                plantModel.temparature.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: BaseColor.backgroundWhite,
                                      fontSize: 14,
                                    ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.check_box_outline_blank_rounded,
                                size: 35,
                                color: BaseColor.white,
                              ),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              Text(
                                "Pot",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: BaseColor.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                maxLines: 1,
                              ),
                              Text(
                                plantModel.pot.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: BaseColor.backgroundWhite,
                                      fontSize: 14,
                                    ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Spacer(),

                      /// total
                      TotalWidget(
                        height: height,
                        price: plantModel.price,
                        width: width,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.width,
    required this.title,
  });

  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      child: Text(
        title.toString(),
        style: const TextStyle(
          color: BaseColor.black,
          fontSize: 28,
          fontWeight: FontWeight.w800,
        ),
        maxLines: 1,
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.width,
    required this.description,
  });

  final double width;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      child: Text(
        description.toString(),
        style: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 15,
          // fontWeight: FontWeight.w800,
        ),
        maxLines: 3,
      ),
    );
  }
}

class TotalWidget extends StatelessWidget {
  const TotalWidget({
    super.key,
    required this.height,
    required this.price,
    required this.width,
  });

  final double height;
  final double price;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Total Price",
              style: TextStyle(
                color: BaseColor.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Text(
              "\$${price.toString()}",
              style: const TextStyle(
                color: BaseColor.white,
                fontSize: 19,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        SizedBox(
          width: width * 0.1,
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: MaterialButton(
              height: height * 0.08,
              color: BaseColor.green2,
              onPressed: () {},
              child: const Text(
                "Add to cart",
                style: TextStyle(
                  color: BaseColor.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
