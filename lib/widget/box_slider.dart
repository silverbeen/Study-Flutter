import 'package:flutter/material.dart';
import 'package:flutter_start_app/modal/modal_movie.dart';
import 'package:flutter_start_app/screen/detail_screen.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;

  const BoxSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('지금 뜨는 콘텐츠'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(context, movies),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages(BuildContext context, List<Movie> movies) {
  List<Widget> result = [];
  for (var i = 0; i < movies.length; i++) {
    result.add(InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return DetailScreen(
                /// 현재 페이지에 해당하는 movie의 상태를 파라미터로 넘겨준다. (Props 같은 의미)
                movie: movies[i],
              );
            }));
      },
      child: Container(
        padding: const EdgeInsets.only(right: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset('images/${movies[i].poster}'),
        ),
      ),
    ));
  }

  return result;
}
