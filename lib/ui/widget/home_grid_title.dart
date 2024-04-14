import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeGridTitle extends StatelessWidget {
  final String text;
  final String image;
  final double price;
  final Function()? onTap;
  final int id;

  const HomeGridTitle({
    super.key,
    required this.text,
    required this.id,
    required this.price,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ColoredBox(
          color: Colors.white,

          // ontap function to be clear item new delectlist add to cart
          // onTap: () {
          // },
          child: Column(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Icon(Icons.delete)],
                ),
              ),
              Image.network(
                image,
                height: 120,
                width: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Text(
                text.characters.take(20).toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '\$ $price',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
