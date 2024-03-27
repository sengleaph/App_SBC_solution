import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbc_app/data/response/status.dart';
import 'package:sbc_app/model/product_model/product_model.dart';
import 'package:sbc_app/view/home_page.dart';
import 'package:sbc_app/view/product/widget/product_cart.dart';
import 'package:sbc_app/view/product/widget/product_detail.dart';
import 'package:sbc_app/viewmodel/product_viewmodel/product_viewmodel.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _productViewModel = ProductViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productViewModel.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
        title: Text(
          "Product",
          style: TextStyle(color: Colors.black),
        ),
        // centerTitle: true,
      ),
      body: Container(
        child: ChangeNotifierProvider(
          create: (context) => _productViewModel,
          child: Consumer<ProductViewModel>(
            builder: (context, viewModel, _) {
              switch (viewModel.response.status) {
                case Status.LOADING:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.COMPLETED:
                  ProductModel productModel = viewModel.response.data;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: productModel.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetail(
                                    productData: productModel.data![index]),
                              )),
                          child: ProductCart(
                            productData: productModel.data![index],
                          ));
                    },
                  );
                case Status.ERROR:
                  return Text(' Error: ${viewModel.response.message}');
                default:
                  return Text("Unknown status!");
              }
            },
          ),
        ),
      ),
    );
  }
}
