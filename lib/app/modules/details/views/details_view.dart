import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mcu_wiki/app/core/values/values.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/details_controllers.dart';

class DetailsView extends GetView<DetailsController> {
  DetailsView({Key? key}) : super(key: key);

  var receivedData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.black, size: 20),
        ),
        title: Text(
          'DETAILS OF ${receivedData?[1]['title']}'.toUpperCase(),
          style: AppTextStyles.header,
        ),
        backgroundColor: Colors.white70,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        children: [
          Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: receivedData[0]['url'] != null
                    ? NeuMorphic().neuContainer(mcuImageList())
                    : Image.asset(
                        'images/mcu.jpg',
                        width: size.width * 2 / 3,
                      )),
          ),
          SizedBox(height: size.height / 30),
          Text(
            receivedData?[1]['title'].toString().toUpperCase() ?? "",
            textAlign: TextAlign.center,
            style: AppTextStyles.header,
          ),
          SizedBox(height: size.height / 30),
          Text(
            receivedData?[2]['overview'] ?? "N/A",
           textAlign: TextAlign.justify,
            style: AppTextStyles.normalText,
          ),
          SizedBox(height: size.height / 30),
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(text: "Directed by:  ", style: AppTextStyles.normalText2),
            TextSpan(
                text: receivedData?[3]['directedBy'] ?? "N/A",
                style: AppTextStyles.valueText),
          ])),
          SizedBox(height: size.height / 30),
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(text: "Realise date:  ", style: AppTextStyles.normalText2),
            TextSpan(
                text: receivedData?[4]['realise'] ?? "N/A",
                style: AppTextStyles.valueText),
          ])),
          SizedBox(height: size.height / 30),
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(text: "Duration: ", style: AppTextStyles.normalText2),
            TextSpan(
                text: receivedData?[5]['duration'].toString() ?? "N/A",
                style: AppTextStyles.valueText),
          ])),
          SizedBox(height: size.height / 30),
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(text: "Box office:  ", style: AppTextStyles.normalText2),
            TextSpan(text: moneyTransform(), style: AppTextStyles.valueText),
          ])),
          SizedBox(height: size.height / 30),
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(text: "Phase:  ", style: AppTextStyles.normalText2),
            TextSpan(
                text: receivedData?[7]['phase'].toString() ?? "N/A",
                style: AppTextStyles.valueText),
          ])),
          SizedBox(height: size.height / 30),
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(text: "Chronology:  ", style: AppTextStyles.normalText2),
            TextSpan(
                text: receivedData?[8]['chronology'].toString() ?? "N/A",
                style: AppTextStyles.valueText),
          ])),
        ],
      ),
    );
  }

  Widget mcuImageList() {
    return CachedNetworkImage(
      imageUrl: receivedData[0]['url'],
      placeholder: (context, url) => Image.asset('assets/mcu.jpg'),
    );
  }

  String moneyTransform() {
    String money = receivedData?[6]['boxOffice'] ?? "N/A";
    String moneyOutput = "";
    var moneyLen = money.length;
    var beforeDot = moneyLen % 3;
    var moneyText = "";
    if (moneyLen <= 3) {
      return "N/A";
    }
    if (moneyLen > 9) {
      moneyText = "billion";
    } else if (moneyLen > 6) {
      moneyText = "million";
    } else if (moneyLen > 3) {
      moneyText = "thousand";
    }

    if (beforeDot == 0) {
      moneyOutput = "\$${money.substring(0, 3)} $moneyText";
    } else {
      moneyOutput =
          "\$${money.substring(0, beforeDot)}.${money.substring(beforeDot + 1, beforeDot + 3)} $moneyText";
    }
    return moneyOutput;
  }
}
