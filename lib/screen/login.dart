import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:watcha_pedia_clone/router/router_notifier.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(ref.read(goRouterNotifierProvider).isLoggedIn.toString()),
        ElevatedButton(
            onPressed: () {
              ref.read(goRouterNotifierProvider).isLoggedIn = true;
            },
            child: const Text("Login")),
        ElevatedButton(
            onPressed: () {
              ref.read(goRouterNotifierProvider).isLoggedIn = false;
            },
            child: const Text("Logout"))
      ],
    ));
  }
}
