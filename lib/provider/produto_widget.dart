import 'package:flutter/material.dart';
import 'package:flutter_provider_example/provider/produto_model.dart';
import 'package:provider/provider.dart';

class ProdutoWidget extends StatelessWidget {
  const ProdutoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.green,
      child: Text(context.read<ProdutoModel>().nome),
    );
  }
}
