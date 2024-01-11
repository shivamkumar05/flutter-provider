import 'package:count_provider/provider/favorite_provider.dart';
import 'package:count_provider/screen/my_favorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  // List<int> selectedItem = [];
  Widget build(BuildContext context) {
    print('build');
    // final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Screen"),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyFavoriteItem()));
              },
              child: Icon(Icons.favorite)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavoriteProvider>(
                  builder: (context, valueP, child) {
                    return ListTile(
                      onTap: () {
                        print(index.toString());
                        if (valueP.selectedItem.contains(index)) {
                          valueP.removeFromFavorites(index);
                        } else {
                          valueP.addItem(index);
                        }
                      },
                      title: Text("item" + index.toString()),
                      trailing: Icon(valueP.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      // Column(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: 100,
      //         itemBuilder: (context, index) {
      //           // return ListTile(
      //           //   onTap: () {
      //           //     // selectedItem.add(index);
      //           //     // setState(() {});

      //           //     provider.addItem(index);
      //           //   },
      //           //   title: Text("item" + index.toString()),
      //           //   trailing: Icon(provider.selectedItem.contains(index)
      //           //       ? Icons.favorite
      //           //       : Icons.favorite_border_outlined),
      //           // );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
