import 'package:flutter/material.dart';

import '../models/post_model.dart';

class ItemPostWidget extends StatelessWidget {
  ItemPostWidget({super.key, this.postModel});
  PostModel? postModel;

  @override
  Widget build(BuildContext context) {
    final icoMore = Icon(
      Icons.more_horiz,
      size: 35,
    );
    final cardDesc = Container(
      color: Colors.pink,
      height: 100,
      child: Text('${postModel!.dscPost}'),
    );
    final rowfooter = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Fecha: ${postModel!.datePost}'),
        Icon(Icons.thumb_up),
      ],
    );
    final ribbonTop = ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: Container(
        padding: EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        height: 35,
        child: icoMore,
        width: double.infinity,
        color: Color.fromARGB(255, 224, 214, 160),
      ),
    );
    final ribbonBottom = ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerRight,
        height: 45,
        child: rowfooter,
        width: double.infinity,
        color: Color.fromARGB(255, 190, 203, 166),
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 246, 246, 246),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 160, 160, 160),
                  blurRadius: 7,
                  spreadRadius: 5,
                  offset: Offset(0, 5))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ribbonTop,
            cardDesc,
            Divider(
              thickness: 3,
            ),
            ribbonBottom,
          ],
        ),
      ),
    );
  }
}
