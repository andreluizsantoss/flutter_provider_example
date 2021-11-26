import 'package:flutter/material.dart';
import 'package:flutter_provider_example/change_notifier/provider_controller.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 2));
      context.read<ProviderController>().alterarDados();
    });
  }

  @override
  Widget build(BuildContext context) {
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
              // * ===================================================
              // ! Dessa forma o Provider vai rebuildar a tela inteira
              // CircleAvatar(
              //   backgroundImage:
              //       NetworkImage(context.watch<ProviderController>().imgAvatar),
              //   radius: 60,
              // ),

              // * ===================================================
              // ! Dessa forma o Provider vai apenas rebuildar o widget
              // ! Mas rebuilda toda a controller (ou seja todos os widgets)
              // Consumer<ProviderController>(
              //   builder: (_, controller, __) {
              //     return CircleAvatar(
              //       backgroundImage: NetworkImage(controller.imgAvatar),
              //       radius: 60,
              //     );
              //   },
              // ),

              // * ===================================================
              // ! Dessa forma o Provider vai apenas rebuildar o widget específico
              // ! Não vai rebuildar todos os widgets
              Selector<ProviderController, String>(
                selector: (_, controller) => controller.imgAvatar,
                builder: (_, imgAvatar, __) {
                  return CircleAvatar(
                    backgroundImage: NetworkImage(imgAvatar),
                    radius: 60,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // * ===================================================
                  // ! Dessa forma o Provider vai rebuildar a tela inteira
                  // Text(context.watch<ProviderController>().name),
                  // const SizedBox(width: 5),
                  // Text('(${context.watch<ProviderController>().birthDate})'),

                  // * ===================================================
                  // ! Dessa forma o Provider vai apenas rebuildar o widget
                  // ! Mas rebuilda toda a controller (ou seja todos os widgets)
                  // Consumer<ProviderController>(
                  // builder: (_, controller, __) {
                  //   return Text(controller.name);
                  // },
                  // ),
                  // const SizedBox(width: 5),
                  // Consumer<ProviderController>(
                  //   builder: (_, controller, __) {
                  //     return Text('(${controller.birthDate})');
                  //   },
                  // ),

                  // * ===================================================
                  // ! Dessa forma o Provider vai apenas rebuildar o widget específico
                  // ! Não vai rebuildar todos os widgets
                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.name,
                    builder: (_, name, __) {
                      return Text(name);
                    },
                  ),
                  const SizedBox(width: 5),
                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.birthDate,
                    builder: (_, birthDate, __) {
                      return Text(birthDate);
                    },
                  ),
                ],
              ),
              const SizedBox(width: 5),

              // * ===================================================
              // ! Importar o package Tuple
              // ! Através do Tuple você consegue rebuildar de 2 até 7 objetos
              Selector<ProviderController, Tuple2<String, String>>(
                selector: (_, controller) => Tuple2(
                  controller.name,
                  controller.birthDate,
                ),
                builder: (_, tupla, __) {
                  return Text('${tupla.item1} (${tupla.item2})');
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<ProviderController>().alterarNome();
                },
                child: const Text('Alterar Nome'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
