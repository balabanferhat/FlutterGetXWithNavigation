import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_x_with_nav/generated/models/personel.dart';
import 'package:get_x_with_nav/pages/home/rehber_controller.dart';
import 'package:get_x_with_nav/utils/colors.dart';
import 'package:get_x_with_nav/utils/widgets.dart';

class Contact {
  String adi;
  String numarasi;
  Contact({required this.adi, required this.numarasi});
}

class RehberView extends StatelessWidget {
  final RehberController _rehberController = Get.put(RehberController());
  //const RehberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rehber'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              //naviController.selectedIndex.value = 2;
            },
          )
        ],
      ),
      body: Obx(() {
        if (_rehberController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Container(
          child: ListView.builder(
              itemCount: _rehberController.personelList.value.length,
              itemBuilder: (BuildContext context, int index) {
                Personel personel = _rehberController.personelList.value[index];
                return PersonelKart(personel, index);
              }),
        );
      }),
    );
  }

  Widget PersonelKart(Personel personel, index) {
    return Card(
      shadowColor: Colors.black38,
      child: ListTile(
        leading: CircleAvatar(
            child: Image.asset(
          'images/profile.jpg',
          scale: 20,
          fit: BoxFit.cover,
        )),
        title: Text(personel.adi + ' ' + personel.soyadi),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(personel.dahili != 'null' ? '-' : personel.dahili),
            Text(personel.gsm),
            Text(personel.birimi),
          ],
        ),
      ),
    );
  }
}
