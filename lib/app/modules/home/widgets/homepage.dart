import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: FormBuilder(
                child: FormBuilderTextField(
                  name: 'search',
                  decoration: const InputDecoration(
                    labelText: 'Searchmenu...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: DefaultTabController(
                  length: 2,
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: [
                      Tab(
                        text: 'Menu',
                      ),
                      Tab(
                        text: 'Cart',
                      )
                    ],
                  ),
                )),
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
