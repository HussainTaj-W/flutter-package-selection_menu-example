# Using Different ComponentsConfigurations
*Example: 1_basic_05*

## Code Highlights

```dart
import 'package:selection_menu/selection_menu.dart';
import 'package:selection_menu/components_configurations.dart';

SelectionMenu<FlatColor>(
    componentsConfiguration: DropdownComponentsConfiguration<FlatColor>(
      // Overriding specific default behavior will be demonstrated in 
      // later examples.
    ),
    // Other properties...
  );
```

For complete code, explained with details, see [main.dart](./main.dart).
## Result

![Result Gif](./1_05.gif)

[API Docs: DialogComponentsConfiguration](https://pub.dev/documentation/selection_menu/latest/components_configurations/DialogComponentsConfiguration-class.html)

[API Docs: DropdownComponentsConfiguration](https://pub.dev/documentation/selection_menu/latest/components_configurations/DropdownComponentsConfiguration-class.html)

[API Docs: ComponentsConfigurations Library](https://pub.dev/documentation/selection_menu/latest/components_configurations/components_configurations-library.html)
