import 'package:dio_retrofit_poc/domain/services/product_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Consumer(
        builder: (context, ref, child) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final response =
                        await ref.read(productServiceProvider).getAllProducts();

                    print(response);
                  },
                  child: const Text('Print all products!'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final response =
                        await ref.read(productServiceProvider).getProduct(1);

                    print(response);
                  },
                  child: const Text('Print single product!'),
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
