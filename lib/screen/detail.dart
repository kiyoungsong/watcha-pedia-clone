import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).pathParameters["id"];
    print(id);
    return Container(
      child: Text("detail $id임다"),
    );
  }
}
