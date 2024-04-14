import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/cubit/Product_state.dart';
import 'package:flutter_application_1/cubit/products_cubit.dart';
import 'package:flutter_application_1/ui/delete_page.dart';
import 'package:flutter_application_1/ui/widget/home_grid_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/home_model.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.watch<ProductCubit>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeletePage(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Icon(
                      Icons.delete,
                      size: 30,
                    ),
                    BlocBuilder<ProductCubit, ProductState>(
                      builder: (context, state) {
                        if (state is SuccessState) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: ColoredBox(
                                color: const Color.fromARGB(255, 191, 167, 165),
                                child: Text(
                                  homeCubit.deletedProducts.length.toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                )),
          )
        ],
      ),
      body: Expanded(
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is SuccessState) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final product = state.productModel[index];
                  return GestureDetector(
                    onTap: () {
                      // tap delete data product model clear
                    },
                    child: HomeGridTitle(
                      text: state.productModel[index].title!,
                      id: state.productModel[index].id!,
                      price: state.productModel[index].price!,
                      image: state.productModel[index].image!,
                      onTap: () {
                        homeCubit.deleteProduct(product.id!);
                      },
                    ),
                  );
                },
              );
            } else if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return const Center(
                child: Text('Error'),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
