import 'package:flutter/material.dart';
import 'package:flutter_start_app/modal/modal_movie.dart';
import 'dart:ui';

class DetailScreen extends StatefulWidget {
  final Movie movie;

  DetailScreen({super.key, required this.movie});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  get like => widget.movie.like;

  @override
  void initState() {
    super.initState();
    // var like = widget.movie.like;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/${widget.movie.poster}'),
                          fit: BoxFit.cover)),
                  child: ClipRect(
                    child: BackdropFilter(
                      // 뒤에 뿌옇게 해주는 역할
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.black.withOpacity(0.1),
                        child: Container(
                          /// 세로로 정렬
                          /// 사진-알고리즘-제목-재생버튼-내용소개
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 45, 0, 10),
                                height: 300,
                                child: Image.asset(
                                    'images/${widget.movie.poster}'),
                              ),
                              Container(
                                padding: const EdgeInsets.all(7),
                                child: const Text(
                                  '99% 일치 2023 15+ 시즌 1개',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(7),
                                child: Text(
                                  widget.movie.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(3),
                                child: TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        '재생',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: Text(widget.movie.toString()),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.all(5),
                                child: const Text(
                                  '출연 : 현빈, 손예진, 서지혜',
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                /// 상단 AppBar를 만들 수 있다.
                /// 적용 후 상단에 닫기 버튼이 나타난다.
                /// 닫기 버튼은 팝업 다이얼로그에 기본으로 적용되어있어 따로 기능 선언을 하지 않아도 잘 작동 된다.
                Positioned(
                    child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ))
              ],
            ),
            Container(
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: <Widget>[
                          like
                              ? const Icon(Icons.check)
                              : const Icon(Icons.add),
                          const Padding(padding: EdgeInsets.all(5)),
                          const Text('내가 찜한 콘텐츠',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.white60)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      children: const <Widget>[
                        Icon(Icons.thumb_up),
                        Padding(padding: EdgeInsets.all(5)),
                        Text('평가',
                            style:
                                TextStyle(fontSize: 11, color: Colors.white60)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      children: const <Widget>[
                        Icon(Icons.send),
                        Padding(padding: EdgeInsets.all(5)),
                        Text('공유',
                            style:
                                TextStyle(fontSize: 11, color: Colors.white60)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
