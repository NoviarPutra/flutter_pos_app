import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicCartList extends StatelessWidget {
  const BasicCartList({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.total,
  });

  final String imageUrl;
  final String name;
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
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    imageUrl,
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
                  Text(name),
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
                      width: double.infinity,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    margin: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                    ),
                                    child: const Text(
                                      "Detail Product",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    margin: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                    ),
                                    child: const Text(
                                      "Edit",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text("Delete"),
                          )
                        ],
                      ),
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
