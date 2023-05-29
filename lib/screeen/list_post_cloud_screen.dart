import 'package:app1/firebase/post_collection.dart';
import 'package:app1/models/post_model.dart';
import 'package:app1/widgets/item_post_widget.dart';
import 'package:flutter/material.dart';

class ListPostCloudScreen extends StatefulWidget {
  const ListPostCloudScreen({super.key});

  @override
  State<ListPostCloudScreen> createState() => _ListPostCloudScreenState();
}

class _ListPostCloudScreenState extends State<ListPostCloudScreen> {
  PostCollection? postCollection;
  @override
  void initState() {
    // TODO: implement initState

    postCollection = PostCollection();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: postCollection!.getAllPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final idPost = snapshot.data!.docs[index].id;
                final dscPost = snapshot.data!.docs[index].get('dscPost');
                final datePost = snapshot.data!.docs[index].get('datePost');
                return ItemPostWidget(
                    postModel: PostModel(
                        dscPost: dscPost, datePost: datePost.toString()));
              });
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Mal:()'),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
