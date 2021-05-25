import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class shimmerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38, blurRadius: 10, offset: Offset(0, 8))
            ]),
        //Information of selected hospital will be shown below
        child: Shimmer.fromColors(
          baseColor: Colors.grey[200],
          highlightColor: Colors.white,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[200]),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: 100,
                            color: Colors.grey[200],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 10,
                            width: 150,
                            color: Colors.grey[200],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: 250,
                        color: Colors.grey[200],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 10,
                        width: 250,
                        color: Colors.grey[200],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 10,
                        width: 250,
                        color: Colors.grey[200],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 10,
                        width: 250,
                        color: Colors.grey[200],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
