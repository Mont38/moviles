import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/database_helpert.dart';
import '../models/popular_model.dart';
import '../provider/flags_provider.dart';

class ItemPopular extends StatefulWidget {
  ItemPopular({super.key, required this.popularModel});
  PopularModel popularModel;

  @override
  State<ItemPopular> createState() => _ItemPopularState();
}

class _ItemPopularState extends State<ItemPopular> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              fit: BoxFit.fill,
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('https://image.tmdb.org/t/p/w500/' +
                  widget.popularModel.posterPath.toString()),
            ),
          ),
        ),
        Positioned(
          top: 0.0,
          right: 20,
          child: FutureBuilder(
              future: databaseHelper.searchPopular(widget.popularModel.id!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(Icons.favorite),
                      color: snapshot.data != true ? Colors.white : Colors.red,
                      onPressed: () {
                        if (snapshot.data != true) {
                          databaseHelper
                              .INSERTAR(
                                  'tblPopularFav', widget.popularModel.toMap())
                              .then((value) => flag.setflagListPost());
                        } else {
                          databaseHelper
                              .ELIMINAR('tblPopularFav',
                                  widget.popularModel.id!, 'id')
                              .then((value) => flag.setflagListPost());
                        }
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ],
    );
  }
}
