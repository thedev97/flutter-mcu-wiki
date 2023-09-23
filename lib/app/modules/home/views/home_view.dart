import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/values/values.dart';
import '../../../data/response/status.dart';
import '../controllers/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  var homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'MCU WIKIPEDIA',
            style: AppTextStyles.header,
          ),
          backgroundColor: Colors.white70,
          elevation: 0,
        ),
        body: Obx(() {
          switch (homeController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.FAILED:
              return Text(
                'Something went wrong',
                style: AppTextStyles.normalText,
              );
            case Status.SUCCESS:
              return GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15.0),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 110,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: homeController.mcuFilmList.value.data?.length ?? 0,
                  itemBuilder: (BuildContext ctx, int index) {
                    return GestureDetector(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: homeController
                                    .mcuFilmList.value.data![index].coverUrl !=
                                null
                            ? NeuMorphic().neuContainer(mcuImageList(index))
                            : Image.asset('assets/mcu.jpg'),
                      ),
                      onTap: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                  mcuMoviesList: mcuMoviesList[index])),
                        )*/
                      },
                    );
                  });
          }
        }));
  }

  Widget mcuImageList(int index){
    return CachedNetworkImage(
      imageUrl: homeController
          .mcuFilmList.value.data![index].coverUrl
          .toString(),
      placeholder: (context, url) =>
          Image.asset('assets/mcu.jpg'),
    );
  }
}
