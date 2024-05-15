import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:watcha_pedia_clone/screen/person_detail/content.dart';
import 'package:watcha_pedia_clone/service/meta.dart';
import 'package:watcha_pedia_clone/service/person_detail_service.dart';

class PersonDetailScreen extends StatefulWidget {
  const PersonDetailScreen({super.key});

  @override
  State<PersonDetailScreen> createState() => _PersonDetailScreenState();
}

class _PersonDetailScreenState extends State<PersonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).pathParameters["id"] ?? "0";
    final item = PersonService().getDetail(int.parse(id));

    return FutureBuilder(
        future: item,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            final info = snapshot.data!;

            return PersonDetailContent(
              info: info,
            );
          }
        });
  }
}
