import 'package:flutter_application_1/data/model/home_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class LoadingState extends ProductState {}

class ErrorState extends ProductState {}

class SuccessState extends ProductState {
  List<HomeModel> productModel;
  SuccessState({
    required this.productModel,
  });
}

class DeleteState extends ProductState {
  List deletedProduct;
  DeleteState({
    required this.deletedProduct,
  });
}
