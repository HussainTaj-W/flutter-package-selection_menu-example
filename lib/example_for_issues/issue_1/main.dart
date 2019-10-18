import 'package:flutter/material.dart';
import 'package:selection_menu/components_configurations.dart';
import 'package:selection_menu/selection_menu.dart';

/// (Issue Link)[https://github.com/HussainTaj-W/flutter-package-selection_menu/issues/1]

class Rectangle {
  double size;
  Color color;

  Rectangle({this.color, this.size});
}

List<Rectangle> listData = [
//  Rectangle(color: Colors.redAccent, size: 10),
//  Rectangle(color: Colors.blueAccent, size: 40),
//  Rectangle(color: Colors.greenAccent, size: 100),
];

class ExampleApp extends StatelessWidget {

  static Widget _listViewBuilder(ListViewComponentData data) {
    if (data.itemCount == 0) {
      return Center(
        child: Text("There is nothing here."),
      );
    }
    return ListView.builder(
      itemBuilder: data.itemBuilder,
      itemCount: data.itemCount,
      padding: EdgeInsets.zero,
    );
  }

  Widget itemBuilder(
      BuildContext context, Rectangle rectangle, OnItemTapped onItemTapped) {
    return Container(
      color: rectangle.color,
      height: rectangle.size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SelectionMenu<Rectangle>(
        componentsConfiguration: DialogComponentsConfiguration<Rectangle>(
          listViewComponent: ListViewComponent(builder: _listViewBuilder),
        ),
        itemsList: listData,
        itemBuilder: this.itemBuilder,
        onItemSelected: this.onItemSelected,
      ),
    );
  }

  void onItemSelected(Rectangle rectangle) {
    print('${rectangle.size} size rectangle.');
  }
}

void main() => runApp(
      MaterialApp(
        theme: ThemeData.light().copyWith(
            accentColor: Colors
                .redAccent, // Used by the default Dialog Style of SelectionMenu
            cardTheme: ThemeData.light().cardTheme.copyWith(
                  elevation: 5,
                )),
        home: Material(
          child: Container(
            color: Color(0xff95a5a6),
            child: Center(child: ExampleApp()),
          ),
        ),
      ),
    );
