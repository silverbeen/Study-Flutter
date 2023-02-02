import 'package:flutter/material.dart';
import 'package:flutter_start_app/modal/modal_movie.dart';
import 'package:flutter_start_app/screen/detail_screen.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;

  const CircleSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('미리보기'),
          Container(
            height: 120,
            child: ListView(
              //  Axis.vertical 위 아래로 스크롤 가능 (default : vertical)
              scrollDirection: Axis.horizontal,
              children: makeCircleImages(context, movies),
            ),
          )
        ],
      ),
    );
  }
}

/// InkWell 위젯
/// Container와 같이 제스쳐 기능을 제공하지 않는 위젯을 래핑하여 onTap 기능 제공
/// InkWell 위젯을 탭하면 물결 모양의 애니메이션 효과가 발생함
List<Widget> makeCircleImages(BuildContext context, List<Movie> movies) {
  List<Widget> result = [];
  for (var i = 0; i < movies.length; i++) {
    result.add(
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return DetailScreen(
                  // 현재 페이지에 해당하는 movie의 상태를 파라미터로 넘겨준다. (Props 같은 의미)
                  movie: movies[i],
                );
              }));
        },
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage('images/' + movies[i].poster),
              radius: 48,
            ),
          ),
        ),
      ),
    );
  }

  return result;
}
