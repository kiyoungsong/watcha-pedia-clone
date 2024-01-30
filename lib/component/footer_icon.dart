import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FooterIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> pathKey;
  final VoidCallback onClick;
  const FooterIcon(
      {required this.title,
      required this.icon,
      required this.pathKey,
      required this.onClick,
      super.key});

  @override
  Widget build(BuildContext context) {
    String currentUrl =
        GoRouterState.of(context).uri.toString().replaceAll("/", "");

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onClick,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: getTextColor(currentUrl, pathKey)),
            SizedBox(
              height: 6,
            ),
            Text(title, style: getStyle(currentUrl, pathKey))
          ],
        ),
      ),
    );
  }

  TextStyle getStyle(String url, List<String> key) {
    TextStyle commonStyle = TextStyle(
        fontSize: 11.5, height: 1.2, color: Color.fromARGB(255, 186, 186, 195));
    return key.contains(url)
        ? commonStyle.copyWith(color: Colors.black)
        : commonStyle;
  }

  Color getTextColor(String url, List<String> key) {
    return key.contains(url)
        ? Colors.black
        : Color.fromARGB(255, 186, 186, 195);
  }
}
