import 'dart:io';
import 'package:flutter_application_1/cubit/Product_state.dart';
import 'package:flutter_application_1/data/service/home_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/home_model.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  List<HomeModel> deletedProducts = [];
  bool selected = false;

  void selectCategory() {
    selected = !selected;
  }

  void productFetching() async {
    emit(LoadingState());
    try {
      final products = await HomeApiService.getProducts();
      emit(SuccessState(productModel: products));
    } on SocketException {
      emit(ErrorState());
    } catch (e) {
      emit(ErrorState());
    }
  }

  void deleteProduct(int id) {
    final List<HomeModel> currentProducts =
        (state as SuccessState).productModel;
    final List<HomeModel> updatedProducts =
        currentProducts.where((product) => product.id != id).toList();
    print(updatedProducts);
    final List<HomeModel> deletedProduct =
        currentProducts.where((product) => product.id == id).toList();
    deletedProducts.addAll(deletedProduct);
    emit(SuccessState(productModel: updatedProducts));
    // emit(DeleteState(deletedProduct: deletedProduct);
  }

  void getDel() {
    final List<HomeModel> deletedProducts =
        (state as SuccessState).productModel;
    print(deletedProducts);
  }

  List<HomeModel> getDeletedProducts() {
    return List.from(deletedProducts);
  }
}
