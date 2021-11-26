import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  String name = 'Nome';
  String imgAvatar = 'https://www.setcesc.com.br/img/tema-4/no-image.png';
  String birthDate = 'Data';

  void alterarDados() {
    name = 'André';
    imgAvatar =
        'https://cdn.pensador.com/img/authors/ho/me/homer-simpson-l.jpg';
    birthDate = '02/04/1977';
    notifyListeners();
  }

  void alterarNome() {
    name = 'André Luiz dos Santos';
    notifyListeners();
  }
}
