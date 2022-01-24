import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_with_nav/pages/home/detail_view.dart';

Widget homeWidget() {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${imgList.indexOf(item)} image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  return SingleChildScrollView(
    child: Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Text("HOME", style: TextStyle(fontSize: 30, fontFamily: 'Bold'))

        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imageSliders,
        ),

        SizedBox(
          height: 10,
        ),

        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 8,
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_drop_down_circle),
                title: const Text('Card title 1'),
                subtitle: Text(
                  'Secondary Text',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: const Color(0xFF6200EE),
                    ),
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                            height: 150,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Text('Hii 1', textScaleFactor: 2),
                                Text('Hii 2', textScaleFactor: 2),
                                Text('Hii 3', textScaleFactor: 2),
                                Text('Hii 4', textScaleFactor: 2),
                              ],
                            )),
                        //barrierColor: Colors.grey[50],
                        //isDismissible: false,
                        /*shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                            side: BorderSide(width: 5, color: Colors.black)),
                        */
                        enableDrag: false,
                      );
                    },
                    child: const Text('ACTION 1'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: const Color(0xFF6200EE),
                    ),
                    onPressed: () {
                      // Perform some action
                      Get.defaultDialog(
                        title: "Sample Dialog",
                        middleText: "You content goes here...",
                        content: Column(
                          children: [
                            Text("Your content goes here widget"),
                            Text("Your content goes here widget"),
                            Text("Your content goes here widget"),
                            Text("Your content goes here widget"),
                          ],
                        ),
                        barrierDismissible: false,
                        radius: 10.0,
                        confirm: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("Confirm")),
                        cancel: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("Cancel")),
                      );
                    },
                    child: const Text('ACTION 2'),
                  ),
                ],
              ),
              GestureDetector(
                child: Image.network(imgList[0]),
                onTap: () => {Get.to(() => DetailView())},
              ),
              //Image.network(imgList[1]),
            ],
          ),
        ),
      ],
    ),
  );
}
