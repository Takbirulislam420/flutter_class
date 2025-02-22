import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class ApiConcept extends StatefulWidget {
  const ApiConcept({super.key});

  @override
  State<ApiConcept> createState() => _ApiConceptState();
}

class _ApiConceptState extends State<ApiConcept> {
  List users = [];
  bool isloading = false;
  Future<void> fatchUser() async {
    setState(() {
      isloading = true;
    });
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    setState(() {
      isloading = false;
    });
    if (response.statusCode == 200) {
      users = jsonDecode(response.body);
    } else {
      throw Exception("unable to load");
    }
  }

  @override
  void initState() {
    fatchUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api concept"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: isloading
          ? ShimmerLoadingWidget()
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        user['name'][0],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      user["name"],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "userName: ${user['username']}",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Email: ${user['email']}",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Phone: ${user['phone']}",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Address: ${user['address']['city']}",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Address: ${user['address']['geo']['lat']}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          10, // You can change this count depending on how many items you want to show during loading
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Card(
            margin: EdgeInsets.all(5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple,
              ),
              title: Container(
                width: 100,
                height: 15,
                color: Colors.grey,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 10,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 150,
                    height: 10,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 150,
                    height: 10,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
