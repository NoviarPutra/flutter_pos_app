import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicCartList extends StatelessWidget {
  const BasicCartList({
    super.key,
    required this.total,
  });

  final String total;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                  child: Image.network(
                    'https://via.placeholder.com/150',
                    fit: BoxFit.fill,
                    width: 100,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("name"),
                  Text(total),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                      ),
                      height: Get.height * 0.3,
                    ),
                  );
                },
                child: const Icon(Icons.more_horiz),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
