import 'package:count_provider/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFavoriteItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build f');
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorite Items"),
      ),
      body: Column(
        children: [
          Consumer<FavoriteProvider>(builder: (context, valueP, child) {
            return Expanded(
              child: ListView.builder(
                  itemCount: valueP.selectedItem.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        print(index.toString());
                        if (valueP.selectedItem
                            .contains(valueP.selectedItem[index])) {
                          print('removed');
                          valueP
                              .removeFromFavorites(valueP.selectedItem[index]);
                        } else {
                          valueP.addItem(index);
                        }
                      },
                      title:
                          Text("item" + valueP.selectedItem[index].toString()),
                      trailing: Icon(valueP.selectedItem
                              .contains(valueP.selectedItem[index])
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  }),
            );
          })
        ],
      ),
    );
  }
}
