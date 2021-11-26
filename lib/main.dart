import 'package:flutter/material.dart';
import 'package:flutter_provider_example/change_notifier/change_notifier_page.dart';
import 'package:flutter_provider_example/change_notifier/provider_controller.dart';
import 'package:flutter_provider_example/provider/provider_page.dart';
import 'package:flutter_provider_example/provider/user_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) {
            return UserModel(
              name: 'André Luiz',
              imgAvatar:
                  'https://cdn.pensador.com/img/authors/ho/me/homer-simpson-l.jpg',
              birthDate: '02/04/1977',
            );
          },
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Provider Example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/provider': (_) => const ProviderPage(),
          '/change_notifier': (_) => const ChangeNotifierPage(),
        },
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/provider');
                      },
                      child: const Text('Provider'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/change_notifier');
                      },
                      child: const Text('Change Notifier'),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
