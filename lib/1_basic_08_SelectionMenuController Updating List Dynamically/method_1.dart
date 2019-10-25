import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selection_menu/selection_menu.dart';

import '../data/FlatColor.dart';

int addedColorCount = 1;

class ExampleApp extends StatelessWidget {
  // Defining the controller
  final SelectionMenuController selectionMenuController =
      SelectionMenuController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SelectionMenu<FlatColor>(
            // Assigning the controller
            selectionMenuController: selectionMenuController,
            itemsList: colors,
            itemBuilder: itemBuilder,
            onItemSelected: onItemSelected,
            showSelectedItemAsTrigger: true,
            closeMenuWhenTappedOutside: false,
            itemSearchMatcher: itemSearchMatcher,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  if (colors.isNotEmpty) colors.removeLast();
                  // Informs that the list has changed
                  selectionMenuController.notifyListUpdated();
                },
                child: Text("Remove Last"),
              ),
              RaisedButton(
                onPressed: () {
                  selectionMenuController.trigger();
                },
                child: Text("Trigger"),
              ),
              RaisedButton(
                onPressed: () {
                  colors.add(FlatColor(
                      hex: 0x77000000, name: "New Added ${addedColorCount++}"));
                  // Informs that the list has changed
                  selectionMenuController.notifyListUpdated();
                },
                child: Text("Add Last"),
              ),
            ],
          )
        ],
      ),
    );
  }

  bool itemSearchMatcher(String searchString, FlatColor color) {
    return color.name.toLowerCase().contains(searchString.trim().toLowerCase());
  }

  Widget itemBuilder(
      BuildContext context, FlatColor color, OnItemTapped onItemTapped) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onItemTapped,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipOval(
                child: Container(
                  color: Color(color.hex),
                  height: 30,
                  width: 30,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    color.name,
                    style: textStyle,
                  ),
                ),
              ),
              Text(
                ('#' + color.hex.toRadixString(16)).toUpperCase(),
                style: textStyle.copyWith(
                  color: Colors.grey.shade600,
                  fontSize: textStyle.fontSize * 0.75,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemSelected(FlatColor color) {
    print(color.name);
  }
}

List<FlatColor> colors = FlatColors.colors;

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
            child: Center(
              child: ExampleApp(),
            ),
          ),
        ),
      ),
    );
