# Flutter MVVM architecture using GetX and DIO: Sample App

This repository demonstrate the sample app that implements Flutter MVVM architecture using GetX and DIO.

### Sample app UI along with Integration Test Gif:
<img src="https://user-images.githubusercontent.com/37363651/153410369-8ef0a717-c4a7-4430-a0dc-3ee07eb3b784.jpg" width="300"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="sample_resources/integration_test.gif" width="300"/>

### Structure in modules

1. **app:** It contains all the modules, bindings, routes, and remote calls that can interact with UI components.
    1. **bindings**: Initial level bindings
    2. **core**: Responsible for reusable components, themes, values, and utility.
    3. **data**: Directory responsible for containing everything related to our data.
    4. **modules**: Each module consists of a page, its respective GetXController, and its dependencies or Bindings.
    5. **network**: Responsible for managing all network operations and their error handling.
    6. **routes**: Storing all the navigation route paths.
2. **I10n:** Localization.
3. **main.dart:** Entry point.

### Library reference resources:

1. **GetX:** https://pub.dev/packages/get
2. **Dio:** https://pub.dev/packages/dio
3. **Animation:** https://pub.dev/packages/flutter_staggered_animations
