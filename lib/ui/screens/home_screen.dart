import 'dart:typed_data';

import 'package:dio_package/blocs/products/products_bloc.dart';
import 'package:dio_package/data/models/category.dart';
import '../../data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        bloc: context.read<ProductsBloc>()..add(GetProductsEvent()),
        builder: (context, state) {
          if (state is LoadingProductsState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorProductsState) {
            return Center(
              child: Text(state.msg),
            );
          }

          List<ProductsModel> products = [];

          if (state is LoadedProductsState) {
            products = state.products;
          }

          if (products.isEmpty) {
            return const Center(
              child: Text("Malumotlar mavjud emas"),
            );
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Text(product.title),
                subtitle: Text(product.description),
                leading: CircleAvatar(
                  child: Image.network(
                    product.images[0],
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image,
                        size: 30,
                      );
                    },
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<ProductsBloc>()
                          ..add(DeleteProductsEvent(id: product.id.toString()));
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.teal,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          context.read<ProductsBloc>().add(
                AddProductsEvent(
                  // productsModel: ProductsModel(
                  //   id: Uint16List.bytesPerElement,
                  //   title: "Salom",
                  //   price: 1234.0,
                  //   description: "Test data",
                  //   images: [
                  //     'https://topcor.ru/uploads/posts/2019-06/1561644098_baykal2.jpg'
                  //   ],
                  // ),
                  productsModel: ProductsModel(
                    id: 5356,
                    title: "Test",
                    price: 1234.4,
                    description: "Test desc",
                    category: CategoryModel(
                      id: 1,
                      name: "Test cate",
                      image: "",
                      creationAt: DateTime.now().toString(),
                      updatedAt: DateTime.now().toString(),
                    ),
                    images: [
                      "https://topcor.ru/uploads/posts/2019-06/1561644098_baykal2.jpg"
                    ],
                    creationAt: DateTime.now().toString(),
                    updatedAt: DateTime.now().toString(),
                  ),
                ),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
