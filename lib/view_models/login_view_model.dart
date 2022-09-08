import 'package:flutter/cupertino.dart';
import 'package:kasamotta/models/repositories/user_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  LoginViewModel({required this.userRepository});

  bool isLoading = false;
  bool isSuccessful = false;

  Future<bool> isSignIn() async {
    return await userRepository.isSignIn();
  }

  Future<void> signIn() async {
    isLoading = true;
    notifyListeners();

    isSuccessful = await userRepository.signIn();

    isLoading = false;
    notifyListeners();
  }
}