import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pelis/domain/entities/movie.dart';

class MovieVerticalListview extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieVerticalListview({
    super.key,
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextPage
  });

  @override
  State<MovieVerticalListview> createState() => _MovieVerticalListviewState();
}

class _MovieVerticalListviewState extends State<MovieVerticalListview> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(widget.loadNextPage == null) return;

      if((scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      controller: scrollController,
      itemCount: widget.movies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context.push('/movie/${widget.movies[index].id}') ,
          child: FadeIn(child: Image.network(widget.movies[index].posterPath))
        );
      },
    );
    
    /*return Row(
      children: [
        const SizedBox(width: 10),
        Column(
          children: [
            SizedBox(
              height: size.height / 4.4,
              width: (size.width / 3) - 20,
              child: const Placeholder()
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            SizedBox(
              height: size.height / 4.4,
              width: (size.width / 3) - 20,
              child: const Placeholder()
            ),
          ]
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            SizedBox(
              height: 200,
              width: (size.width / 3) - 20,
              child: const Placeholder()
            ),
          ]
        ),
        const SizedBox(width: 10)
      ],
    );*/
  }
}