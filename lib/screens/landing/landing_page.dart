import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  final ScrollController scrollController;
  const LandingPage({super.key, required this.scrollController});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  // final CommonService commonService = CommonService();
  // final StudentService studentService = StudentService();

  // Accès au ColorController
  // final ColorController colorController = Get.put(ColorController());

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialisation du TabController
    // _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    // Libération des ressources du TabController
    // _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Container(
              // Ajout d'un Container
              color: Colors.white,
              child: Text("Hello world"),
            ),
          ),
          // Carousel Slider
          // SizedBox(
          //   width: double.infinity,
          //   height: 250.0,
          //   child: Container(
          //     color: Colors.grey[300],
          //     child: CarouselSlider.builder(
          //       options: CarouselOptions(
          //         height: double.infinity,
          //         autoPlay: true,
          //         autoPlayInterval: const Duration(seconds: 3),
          //         enableInfiniteScroll: true,
          //         viewportFraction: 1.0,
          //         onPageChanged: (index, reason) {
          //           colorController.updateIndex(index);
          //         },
          //       ),
          //       itemCount:
          //           colorController.images.length, // Synchronisé avec images
          //       itemBuilder: (context, index, realIndex) {
          //         return Container(
          //           decoration: BoxDecoration(
          //             image: DecorationImage(
          //               image: colorController
          //                   .images[index % colorController.images.length]
          //                   .image,
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),

          // Contenu des tabs

          _buildTeacherList(marchands, context),
        ],
      ),
    );
  }
}

final marchands = [
  {
    "name": "Kin Marche",
    "course": "Mathématiques",
    "profileImageUrl":
        "https://upload.wikimedia.org/wikipedia/commons/6/6e/Logo_Kinmarche.png"
  },
  {
    "name": "GGMart",
    "course": "Physique",
    "profileImageUrl":
        "https://www.tala-com.com/medias/pictures/picture-294-1588071196.jpg"
  },
  {
    "name": "Shop Dieu est Grand",
    "course": "Littérature",
    "profileImageUrl":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScWWSkU4O8A15k2Jcl8Q78MpWAV1VUO8uWjg&s"
  },
  {
    "name": "Food Market",
    "course": "Informatique",
    "profileImageUrl":
        "https://lh6.googleusercontent.com/proxy/q8ONpLkL7B6cLEdT8sdX_jy0YK-bdChJV-5tvCnrAwiBXW0u5KW7ke5ReVqsXO7dL-OQ38wQIm9Fp3uK8sNDtCu-QXY2XRHzm6yaEzSOCxVN"
  },
  {
    "name": "SK",
    "course": "Arts",
    "profileImageUrl":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFKkREn2YyliXQ0Yni9gDDMcJeEykTLQ6cIQ&s"
  }
];

Widget _buildTeacherList(
  List<Map<String, String>> teachers,
  BuildContext context,
) {
  return Column(
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Marchands",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: teachers.map((teacher) {
              return Container(
                width: 160.0,
                height: 80.0,
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius:
                      BorderRadius.circular(10.0), // Ajout des coins arrondis
                  image: DecorationImage(
                    image: NetworkImage(teacher['profileImageUrl'] ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    ],
  );
}
