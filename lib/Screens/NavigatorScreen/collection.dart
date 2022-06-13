import 'package:carpooling_app/Controller/Firebase/firestore.dart';
import 'package:carpooling_app/Model/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
 import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Collection>>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  snapshot.data!.docs[index].data().name,
                ),
                subtitle: Text(
                  snapshot.data!.docs[index].data().phone,
                ),
                trailing: const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 50,
                  backgroundImage: AssetImage('images/person.png'),
                ),
                leading: SizedBox(
                  width: 100,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.black87),
                        onPressed: () {
                          FireStore().deleteCollection(
                              id: snapshot.data!.docs[index].id);
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.phone_outlined,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                          launch(
                              "tel://${snapshot.data!.docs[index].data().phone}");
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return  Text(AppLocalizations.of(context)!.no_data);
      },
      stream: FireStore().readCollectionUsers(),
    );
  }
}
