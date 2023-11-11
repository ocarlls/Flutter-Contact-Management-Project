import 'package:crud_flutter/app/http/exceptions.dart';
import 'package:crud_flutter/app/model/user_model.dart';
import 'package:crud_flutter/app/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class UserStore {
  final UsuarioRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<Usuario>> state =
      ValueNotifier<List<Usuario>>([]);

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  UserStore({required this.repository});

  Future getUsuarios() async {
    isLoading.value = true;
    try {
      final result = await repository.getUsers();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }
    isLoading.value = false;
  }
}