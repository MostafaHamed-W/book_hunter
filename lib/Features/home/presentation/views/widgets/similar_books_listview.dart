import 'package:flutter/cupertino.dart';

import 'custom_book_image.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(
                imageUrl: 'https://edit.org/images/cat/book-covers-big-2019101610.jpg',
                aspectRatio: 70 / 112,
              ),
            );
          }),
    );
  }
}
