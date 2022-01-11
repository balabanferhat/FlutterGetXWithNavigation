import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_x_with_nav/generated/models/personel.dart';
import 'package:get_x_with_nav/pages/home/rehber_controller.dart';
import 'package:get_x_with_nav/utils/colors.dart';
import 'package:get_x_with_nav/utils/widgets.dart';
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
            onPressed: () {
              RehberController().getPersonelListeUpdate();
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

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  Widget PersonelKart(Personel personel, index) {
    return Card(
      shadowColor: Colors.black38,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(personel.cinsiyet != 'Erkek'
              ? "https://www.clipartmax.com/png/middle/71-717812_girl-person-woman-people-icon-profile-woman-icon.png"
              : "https://www.clipartmax.com/png/middle/36-361753_junge-junge-mann-mensch-menschen-avatar-symbol-profile-woman-icon.png"),
        ),
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
