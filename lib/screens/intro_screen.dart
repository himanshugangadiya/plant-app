import 'package:flutter/material.dart';
import 'package:plant_app/constant/dummy_data.dart';
import 'package:plant_app/model/plant_model.dart';
import 'package:plant_app/screens/detailed_screen.dart';
import 'package:plant_app/screens/home_screen.dart';
import 'package:plant_app/utils/base_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: BaseColor.backgroundWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.055,
                  vertical: height * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailedScreen(
                              plantModel: dummyPlantData[currentIndex],
                              index: {currentIndex}.toString(),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Skip",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),

              /// plants pageView builder
              SizedBox(
                height: height * 0.45,
                child: PageView.builder(
                  controller: controller,
                  itemCount: 3,
                  onPageChanged: (val) {
                    setState(() {
                      currentIndex = val;
                    });
                  },
                  itemBuilder: (context, index) {
                    PlantModel plantModel = dummyPlantData[index];
                    return Image.asset(
                      plantModel.image,
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),

              SizedBox(
                height: height * 0.02,
              ),

              /// indicator
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    type: WormType.thinUnderground,
                    activeDotColor: BaseColor.green2,
                  ),
                ),
              ),

              SizedBox(
                height: height * 0.06,
              ),

              /// text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                child: Text(
                  "Enjoy your",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 40,
                        color: BaseColor.black,
                      ),
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Life with",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 40,
                                  color: BaseColor.black,
                                ),
                        maxLines: 1,
                      ),
                    ),
                    Text(
                      "Plants",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 40,
                                color: BaseColor.black,
                                fontWeight: FontWeight.bold,
                              ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: height * 0.06,
              ),

              /// arrow button
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    backgroundColor: BaseColor.green,
                    radius: 42,
                    child: Icon(
                      Icons.arrow_forward,
                      size: 30,
                      color: BaseColor.white,
                    ),
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
