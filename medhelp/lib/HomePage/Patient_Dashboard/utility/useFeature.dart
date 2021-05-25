import 'package:flutter/material.dart';

class useFeature extends StatefulWidget {
  String title;
  String imgUrl;
  String action;

  useFeature(String title, String imgUrl, String action) {
    this.title = title;
    this.imgUrl = imgUrl;
    this.action = action;
  }

  @override
  _useFeatureState createState() => _useFeatureState();
}

class _useFeatureState extends State<useFeature> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, widget.action);
          },
          child: Container(
            child: Column(
              children: [
                Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              blurRadius: 10,
                              offset: Offset(0, 8))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        child: Image(
                          image: AssetImage(widget.imgUrl),
                        ),
                      ),
                    )),
                SizedBox(height: 10),
                Text(
                  widget.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
