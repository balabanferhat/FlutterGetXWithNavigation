import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_with_nav/generated/models/personel.dart';
import 'package:get_x_with_nav/pages/home/rehber_controller.dart';
import 'package:get_x_with_nav/utils/images.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

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
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () async {
              await _rehberController.getPersonelListeUpdate();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.sort_by_alpha,
              color: Colors.white,
            ),
            onPressed: () async {
              await _rehberController.getPersonelListeLowerCase();
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
                return personelKart(personel, index);
              }),
        );
      }),
    );
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  Widget personelKart(Personel personel, index) {
    return Card(
      shadowColor: Colors.black38,
      elevation: 8,
      child: ListTile(
        leading: CircleAvatar(
            backgroundImage: Image.asset(
                    personel.cinsiyet != 'Erkek' ? woman_profile : man_profile,
                    height: 100,
                    width: 100)
                .image,
            radius: 40),
        title: Text(personel.adi + ' ' + personel.soyadi),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(personel.dahili != 'null' ? personel.dahili : '-'),
            InkWell(
              child: Text(personel.gsm),
              onTap: () async {
                if (!await launch(personel.gsm))
                  throw 'Could not launch $personel.gsm';
              },
            ),
            Text(personel.birimi),
          ],
        ),
      ),
    );
  }
}
