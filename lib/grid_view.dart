import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyGridView extends StatelessWidget {
  MyGridView({super.key});

  // ignore: non_constant_identifier_names
  var MyItems = [
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Rabbil"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Rupom"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Hasan"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Salif"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Alhasan"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Nurza"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Nihan"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Nuri"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Sumaiya"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Rabbil"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Rupom"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Hasan"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Salif"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Alhasan"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Nurza"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Nihan"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Nuri"
    },
    {
      "img":
          "https://cdn.ostad.app/user/avatar/2024-10-29T01-40-21.333Z-JPEG_20241029_094013_787436049500905625.jpg",
      "title": "Sumaiya"
    }
  ];

  mySnackBar(context, msg) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("My App"),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 0, childAspectRatio: 1.2),
          itemCount: MyItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                mySnackBar(context, MyItems[index]['title']);
              },
              child: Card(
                child: Container(
                    margin: const EdgeInsets.all(5),
                    width: double.infinity,
                    height: 220,
                    child: Image.network(MyItems[index]['img']!,
                        fit: BoxFit.fill)),
              ),
            );
          },
        ));
  }
}
