import 'package:flutter/material.dart';
import 'package:selection_menu/components_configurations.dart';
import 'package:selection_menu/selection_menu.dart';

import '../../data/FlatColor.dart';

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    print('build for $selected');
    return SafeArea(
      child: Column(children: [
        FlatButton(
            child: Text("TEST"),
            onPressed: (){
              setState((){
                this.selected++;
                print(this.selected);
              });
            }
        ),
        Container(
          child: SelectionMenu<FlatColor>(
            componentsConfiguration:
            DialogComponentsConfiguration<FlatColor>(
              triggerComponent: TriggerComponent(builder: _triggerBuilder),
              triggerFromItemComponent: TriggerFromItemComponent<FlatColor>(
                  builder: _triggerFromItemBuilder),
            ),
            itemsList: colors,
            itemBuilder: this.itemBuilder,
            onItemSelected: this.onItemSelected,
            initiallySelectedItemIndex: selected,
            showSelectedItemAsTrigger: true,
          ),
        )
      ]),
    );
  }
  Widget itemBuilder(
      BuildContext context, FlatColor color, OnItemTapped onItemTapped) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6!;

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
                  color: Color(color.hex!),
                  height: 30,
                  width: 30,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    color.name!,
                    style: textStyle,
                  ),
                ),
              ),
              Text(
                ('#' + color.hex!.toRadixString(16)).toUpperCase(),
                style: textStyle.copyWith(
                  color: Colors.grey.shade600,
                  fontSize: textStyle.fontSize! * 0.75,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool itemSearchMatcher(String searchString, FlatColor color) {
    return color.name!.toLowerCase().contains(searchString.trim().toLowerCase());
  }

  void onItemSelected(FlatColor color) {
    print(color.name);
  }


  static Widget _triggerBuilder(TriggerComponentData data) {
    return ElevatedButton(
      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: data.triggerMenu,
      // color: Colors.white,
      child: Text("Select Color"),
    );
  }

  static Widget _triggerFromItemBuilder(TriggerFromItemComponentData data) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        primary: Color(data.item.hex),
      ),
      onPressed: data.triggerMenu,
      child: Text(
        data.item.name,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

}

//region From Previous Example
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

List<FlatColor> colors = FlatColors.colors;
//endregion
