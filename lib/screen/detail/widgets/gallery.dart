import 'package:flutter/material.dart';
import 'package:watcha_pedia_clone/component/dialog/gallery.dart';
import 'package:watcha_pedia_clone/model/image.dart';

class DetailGallery extends StatefulWidget {
  final List<ImageModel> images;
  const DetailGallery({super.key, required this.images});

  @override
  State<DetailGallery> createState() => _DetailGalleryState();
}

class _DetailGalleryState extends State<DetailGallery> {
  late PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SizedBox(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "갤러리",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    pageController = PageController(initialPage: index);
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return GalleryDialog(
                          controller: pageController,
                          images: widget.images,
                        );
                      },
                    );
                  },
                  child: SizedBox(
                    child: Row(children: [
                      Image.network(
                          "https://media.themoviedb.org/t/p/original${widget.images[index].filePath}",
                          width: 155,
                          fit: BoxFit.fitWidth),
                    ]),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
