import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_nz_club/models/product_model.dart';
import 'package:provider_nz_club/provider/product_provider.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context, listen: false).getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Consumer<AppProvider> _buildBody() {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        if (provider.productList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: provider.productList.length,
              itemBuilder: (context, index) {
                VideoProduct product = provider.productList[index];
                return _dataView(product);
              },
            ),
          );
        }
      },
    );
  }

  Column _dataView(VideoProduct product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("video product id: ${product.id}"),
        Text("video product name: ${product.name}"),
        Text("video product description: ${product.description}"),
        Text("video product price: ${product.price}"),
        Image.network(product.image),
        const SizedBox(
          height: 10,
          width: double.infinity,
          child: Divider(
            color: Colors.black,
            height: 3,
          ),
        ),
        const SizedBox(height: 60.0),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Video Product List"),
      centerTitle: true,
    );
  }
}
