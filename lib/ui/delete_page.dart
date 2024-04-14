import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/Product_state.dart';
import 'package:flutter_application_1/cubit/products_cubit.dart';
import 'package:flutter_application_1/ui/widget/home_grid_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/home_model.dart';

class DeletePage extends StatelessWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.watch<ProductCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Deleted Products'),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final deletedProduct = homeCubit.deletedProducts;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250,
              crossAxisSpacing: 14,
              mainAxisSpacing: 12,
            ),
            itemCount: deletedProduct.length,
            itemBuilder: (context, index) {
              final product = deletedProduct[index];
              return GestureDetector(
                child: HomeGridTitle(
                  text: product.title!,
                  id: product.id!,
                  price: product.price!,
                  image: product.image!,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
