import 'package:flutter/material.dart';
import 'package:flutter_provider_example/provider/produto_model.dart';
import 'package:flutter_provider_example/provider/produto_widget.dart';
import 'package:flutter_provider_example/provider/user_model.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  ! => Forma normal de retornar a instância pelo Provider
    var user = Provider.of<UserModel>(context);

    //  ! => Pode ser substituído por .read
    // ! =>  O .read vai retornar uma instância sem ficar escutando as alterações
    // var user = context.read<UserModel>();

    // ! =>  O .select vai extrair do userModel somente o objeto que gostaria
    // var imageAvatar =
    //     context.select<UserModel, String>((userModel) => userModel.imgAvatar);

    // ! =>  O .watch fica escutando se ocorreu alterações
    // var user = context.watch<UserModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.imgAvatar),
                radius: 60,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user.name),
                  const SizedBox(width: 5),
                  Text('(${user.birthDate})'),
                ],
              ),
              const SizedBox(height: 20),
              Provider(
                create: (_) => ProdutoModel(
                  nome: 'Academia do Flutter',
                ),
                child: const ProdutoWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
