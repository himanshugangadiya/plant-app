import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plant_app/constant/dummy_data.dart';
import 'package:plant_app/model/plant_model.dart';
import 'package:plant_app/screens/detailed_screen.dart';
import 'package:plant_app/utils/base_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController(text: "Plants");
  }

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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                BaseColor.grey,
                BaseColor.backgroundWhite,
                BaseColor.backgroundWhite,
                BaseColor.backgroundWhite,
              ],
            ),
          ),
        ),
        leadingWidth: 58,
        title: const Text("Search Products"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.045),
            child: const CircleAvatar(
              backgroundColor: Colors.blueAccent,
              backgroundImage: NetworkImage(
                "https://www.sarojhospital.com/images/testimonials/dummy-profile.png",
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                BaseColor.grey,
                BaseColor.backgroundWhite,
                BaseColor.backgroundWhite,
                BaseColor.backgroundWhite,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.055),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.025,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          color: BaseColor.white,
                          child: TextField(
                            controller: searchController,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: BaseColor.black,
                              ),
                            ),
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: height * 0.055,
                        width: height * 0.055,
                        color: BaseColor.white,
                        child: const Icon(Icons.menu),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Expanded(
                  child: MasonryGridView.builder(
                    itemCount: dummyPlantData.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.02,
                    ),
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 18,
                    itemBuilder: (context, index) {
                      PlantModel model = dummyPlantData[index];
                      return index == 0
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(
                                  "Found\n${dummyPlantData.length} Results",
                                  style: const TextStyle(
                                    fontSize: 30,
                                    height: 1.3,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                PlantWidget(
                                  height: height,
                                  plantModel: model,
                                  index: index.toString(),
                                ),
                              ],
                            )
                          : PlantWidget(
                              height: height,
                              plantModel: model,
                              index: index.toString(),
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// plant widget
class PlantWidget extends StatelessWidget {
  final double height;
  final PlantModel plantModel;
  final String index;
  const PlantWidget({
    super.key,
    required this.height,
    required this.plantModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailedScreen(
                plantModel: plantModel,
                index: index,
              ),
            ),
          );
        },
        child: Container(
          color: BaseColor.white,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: index,
                child: Image.asset(
                  plantModel.image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                plantModel.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
                maxLines: 1,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "\$${plantModel.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: BaseColor.black,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: BaseColor.white,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
