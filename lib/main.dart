import 'package:dio_package/blocs/products/products_bloc.dart';
import 'package:dio_package/core/app.dart';
import 'package:dio_package/data/repository/products_repository.dart';
import 'package:dio_package/data/services/dio_products_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  final dioProductsService = DioProductsService();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductsRepository(
            dioProductsService: dioProductsService,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductsBloc(
              productsRepo: context.read<ProductsRepository>(),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
  // runApp(MyApp());
}
