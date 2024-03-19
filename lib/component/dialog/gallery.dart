import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watcha_pedia_clone/model/image.dart';

class GalleryDialog extends StatefulWidget {
  final PageController controller;
  final List<ImageModel> images;

  const GalleryDialog(
      {required this.controller, required this.images, super.key});
  @override
  State<GalleryDialog> createState() => _GalleryDialogState();
}

class _GalleryDialogState extends State<GalleryDialog> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = widget.controller;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: Border.all(width: 0),
      backgroundColor: Colors.grey,
      child: SizedBox(
        height: 190,
        child: Stack(children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.images
                .map((e) => Image.network(
                    "https://media.themoviedb.org/t/p/original${e.filePath}",
                    fit: BoxFit.fill))
                .toList(),
          ),
          if (pageController.initialPage != 0)
            GestureDetector(
              onTap: () {
                pageController.animateToPage(
                  pageController.initialPage - 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                setState(() {
                  pageController = PageController(
                      initialPage: pageController.initialPage - 1);
                });
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 0.7),
                  child: SvgPicture.asset("assets/icons/left.svg"),
                ),
              ),
            ),
          if (pageController.initialPage != widget.images.length - 1)
            GestureDetector(
              onTap: () {
                pageController.animateToPage(
                  pageController.initialPage + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                setState(() {
                  pageController = PageController(
                      initialPage: pageController.initialPage + 1);
                });
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 0.7),
                  child: SvgPicture.asset("assets/icons/right.svg"),
                ),
              ),
            )
        ]),
      ),
    );
  }
}
