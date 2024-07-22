import 'package:dio_package/data/repository/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/products_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository;

  ProductsBloc({required ProductsRepository productsRepo})
      : _productsRepository = productsRepo,
        super(InitialProductsState()) {
    on<GetProductsEvent>(_getProducts);
    on<AddProductsEvent>(_addProducs);
    on<EditProductsEvent>(_editProducts);
    on<DeleteProductsEvent>(_deleteProducts);
  }

  void _getProducts(GetProductsEvent event, Emitter<ProductsState> emit) async {
    emit(LoadingProductsState());
    try {
      final response = await _productsRepository.getProducts();
      // print("Qaytgan response BLocdan: $response");
      emit(LoadedProductsState(response));
    } catch (e) {
      emit(ErrorProductsState(e.toString()));
    }
  }

  void _addProducs(AddProductsEvent event, Emitter<ProductsState> emit) async {
    emit(LoadingProductsState());
    try {
      // print(
      //     "Sending product data: ${event.productsModel.toMap()}");
      await _productsRepository.addProduct(event.productsModel);

      final updatedProducts = await _productsRepository.getProducts();
      emit(LoadedProductsState(updatedProducts));
    } catch (e) {
      print("Add error info: $e");
      emit(ErrorProductsState("Add error: $e"));
    }
  }

  void _editProducts(
      EditProductsEvent event, Emitter<ProductsState> emit) async {
    emit(LoadingProductsState());
    try {
      await _productsRepository.updateProduct(event.productsModel);

      final updatedProducts = await _productsRepository.getProducts();
      emit(LoadedProductsState(updatedProducts));
    } catch (e) {
      emit(ErrorProductsState("Edit error: $e"));
    }
  }

  void _deleteProducts(
      DeleteProductsEvent event, Emitter<ProductsState> emit) async {
    emit(InitialProductsState());
    try {
      await _productsRepository.deleteProduct(event.id);

      final updatedProducts = await _productsRepository.getProducts();
      emit(LoadedProductsState(updatedProducts));
    } catch (e) {
      print('Delete error details: $e');
      emit(ErrorProductsState("Delete error: $e"));
    }
  }
}
