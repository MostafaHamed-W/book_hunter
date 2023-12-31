import 'package:book_hunt/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_hunt/Features/home/presentation/views/widgets/shimmers.dart';
import 'package:book_hunt/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/custom_error_widget.dart';
import 'custom_book_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: GestureDetector(
                      onTap: () => GoRouter.of(context)
                          .push(AppRouter.kBookDetailsView, extra: state.books[index]),
                      child: CustomBookImage(
                          imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? 'url'),
                    ),
                  );
                });
          } else if (state is FeaturedBooksFailure) {
            debugPrint(state.errMessage);
            return Center(child: CustomErrorWidget(errMessage: state.errMessage));
          } else {
            return const FeaturedBooksListShimmer();
            // const Center(
            //   child: CircularProgressIndicator(),
            // );
          }
        },
      ),
    );
  }
}
