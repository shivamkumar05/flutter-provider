import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier {
  List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void addItem(int index) {
    _selectedItem.add(index);
    notifyListeners();
  }

  void removeFromFavorites(index) {
    _selectedItem.remove(index);
    notifyListeners();
  }
}
