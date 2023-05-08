import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:omnishare_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            decoration: BoxDecoration(
                color: AppColors.secondaryBackground,
                border: Border.all(
                  color: Colors.transparent,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: [
                            Row(children: [
                              Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.blue.shade800,
                                        child: const Text('MP'),
                                      ))
                                ],
                              ),
                              Expanded(
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(children: [
                                        Text("MontyPython#0001@Python")
                                      ]),
                                      Column(children: [Text("2023-05-05")])
                                    ],
                                  ),
                                  Divider(color: grey_100),
                                ]),
                              )
                            ]),
                            const ReadMore(
                                shortText: "Short description heheee",
                                longText:
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu imperdiet velit. Morbi ut ipsum nec magna pretium lobortis. Sed porta dignissim nulla vitae egestas. Suspendisse blandit nunc felis, aliquet ullamcorper est dictum sed. Quisque tincidunt finibus metus, at blandit nunc tincidunt lacinia. Vestibulum tempus, lectus pharetra hendrerit mattis, tellus eros efficitur urna, finibus maximus enim nunc at nunc. Maecenas a ipsum vitae turpis porttitor pretium interdum sit amet enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum ornare imperdiet urna at euismod. Nunc ut lectus tristique, fringilla diam et, efficitur nulla. Suspendisse neque risus, laoreet vitae malesuada semper, auctor non lacus. In condimentum nibh eu mollis mollis.")
                          ],
                        ),
                      ),
                    ],
                  )),
            )));
  }
}

class ReadMore extends StatefulWidget {
  const ReadMore({super.key, required this.shortText, required this.longText});
  final String shortText;
  final String longText;

  @override
  State<ReadMore> createState() => _ReadMore();
}

class _ReadMore extends State<ReadMore> {
  bool _readMore = false;

  void _toggleReadMore() {
    setState(() {
      _readMore = !_readMore;
    });
    print(_readMore);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Flexible(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 5.0),
                  child: Text(
                      textAlign: TextAlign.justify,
                      _readMore ? widget.longText : widget.shortText)))
        ],
      ),
      Row(
        children: [
          Flexible(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 5.0),
                  child: Center(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: const StadiumBorder(),
                          side: BorderSide(
                              width: 1, color: AppColors.mainAccent)),
                      child: Text(
                          style: TextStyle(color: AppColors.mainText),
                          _readMore ? "Read less" : "Read more"),
                      onPressed: () => _toggleReadMore(),
                    ),
                  )))
        ],
      )
    ]);
  }
}
