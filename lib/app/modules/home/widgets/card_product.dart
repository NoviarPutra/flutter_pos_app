import 'package:flutter/material.dart';
import 'package:pos_app/utils/color_pallete.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.url,
    required this.productName,
    required this.price,
    required this.stock,
    this.decorationColor,
  });

  final String url;
  final String productName;
  final String price;
  final String stock;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8.0), // Same border radius as the Card
              ),
              child: Image.network(
                url,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp. $price',
                        style: const TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Stock: $stock',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
