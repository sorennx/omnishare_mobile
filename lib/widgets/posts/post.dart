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
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: [
                            Row(children: [
                              Column(
                                children: [
                                  Icon(Icons.person, size: 50),
                                ],
                              ),
                              Expanded(
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(children: [
                                        Text("Monty#0001@Python")
                                      ]),
                                      Column(children: [Text("2023-05-05")])
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                          child: Text(
                                              textAlign: TextAlign.justify,
                                              "Short description describes the description of the description in the description"))
                                    ],
                                  ),
                                ]),
                              )
                            ]),
                            Row(
                              children: [
                                Flexible(
                                    child: Text(
                                        textAlign: TextAlign.justify,
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam accumsan congue magna volutpat eleifend. Vivamus in porta tellus. Donec sodales dui non quam tempor interdum. Donec condimentum semper massa, sed euismod nibh bibendum at. Fusce justo nisi, mollis ac quam non, pellentesque egestas neque. Suspendisse vehicula cursus nisl id commodo. Quisque id nisl imperdiet, dictum mauris in, tristique ex. Sed et nisl ut tellus feugiat pellentesque vel id magna. Nam placerat ex nisl. Morbi sit amet commodo nulla. Morbi fringilla dolor vel est suscipit, a convallis ante feugiat. Maecenas viverra enim eu turpis condimentum, nec ultricies justo placerat. Vivamus et suscipit elit, sit amet sodales nulla."))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            )));
  }
}
