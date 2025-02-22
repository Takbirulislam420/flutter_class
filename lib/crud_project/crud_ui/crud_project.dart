import 'package:flutter/material.dart';
import 'package:flutter_class/crud_project/controller/product_controller.dart';

class CrudProject extends StatefulWidget {
  const CrudProject({super.key});

  @override
  State<CrudProject> createState() => _CrudProjectState();
}

class _CrudProjectState extends State<CrudProject> {
  final ProductController productController = ProductController();
  void createProduct() {
    TextEditingController productName = TextEditingController();
    TextEditingController productCode = TextEditingController();
    TextEditingController productQty = TextEditingController();
    TextEditingController productImage = TextEditingController();
    TextEditingController productUnitPrice = TextEditingController();
    TextEditingController productTotalPrice = TextEditingController();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Create Product"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: productName,
                    decoration: InputDecoration(labelText: "Product Name"),
                  ),
                  TextField(
                    controller: productQty,
                    decoration: InputDecoration(labelText: "Qty"),
                  ),
                  TextField(
                    controller: productImage,
                    decoration: InputDecoration(labelText: "image"),
                  ),
                  TextField(
                    controller: productUnitPrice,
                    decoration: InputDecoration(labelText: "unit price"),
                  ),
                  TextField(
                    controller: productTotalPrice,
                    decoration: InputDecoration(labelText: "Total Price"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {
                              setState(() {
                                productController.createProducts(
                                    productName.text,
                                    productCode.text,
                                    int.parse(productQty.text),
                                    int.parse(productUnitPrice.text),
                                    int.parse(productTotalPrice.text));
                                fetchAppData();
                              });

                              Navigator.pop(context);
                            },
                            child: Center(
                                child: Text(
                              "Add",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                                child: Text(
                              "Cancel",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ))),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }

  Future<void> fetchAppData() async {
    await productController.fetchProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchAppData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud Project"),
        backgroundColor: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createProduct();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
          itemCount: productController.Products.length,
          itemBuilder: (contex, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text(
                    productController.Products[index]['ProductName'][0],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  "ProductName:${productController.Products[index]['ProductName']}",
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text("Image:${productController.Products[index]['Img']}"),
                    Text("qty:${productController.Products[index]['Qty']}"),
                    Text(
                        "unitPrice:${productController.Products[index]['UnitPrice']}"),
                    Text(
                        "TotalPrice:${productController.Products[index]['TotalPrice']}"),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          createProduct();
                        },
                        icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            productController.deleteProducts(
                                productController.Products[index]['_id']);
                            fetchAppData();
                          });
                        },
                        icon: Icon(Icons.delete)),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
