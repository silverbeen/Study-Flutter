// Movie에 들어가는 모델 정의

// 타입 정의
class Movie {
  final String title;
  final String keyword;
  final String poster;
  final bool like;

  Movie.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['link'];

  @override
  String toString() => 'Movie<$title:$keyword>';
}
