# [base_application](https://pub.dev/packages/silent)

With just a few commands I create all
The structure needed to get your Flutter project ready to run.

## Installation

```yaml
dev_dependencies:
  base_application: ^0.0.1
```

# Setup

- Note: By running this command some files in your flutter project will be modified. Example: ```main.dart``` and ```pubspec.yaml```. So I do not advise running this command in a project that already has other configurations made

```
flutter pub run base_application:initialize
```

```
flutter pub get
```

```
flutter pub run gen_i18n:initialize --locale-en-pt
```

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

> It is important to run all these commands to ensure that there is no error

This will create the following structure (Domain Driven Design):
> Simplified View
> 
    .
    ├── ...
    └── lib                         # Predefined directory
        ├── i18n                    # Responsible for translation classes
        ├── src                     
        │   ├── application         # Application layer includes dto and usecase
        │   ├── domain              # Domain layer includes model and service
        │   ├── infrastructure      # Infrastructure layer includes repository, firebase and sqflite
        │   ├── injection           # Injection responsible for the configuration of dependency injections 
        │   ├── presentation        # Presentation layer includes user interface and notifier
        │   ├── utils               # Utils responsible for utility classes   
        │   ├── extension           # Extension responsible for configuring the extensions  
        │   └── app.dart            # Application configuration file 
        ├── main.dart               # Main file
        └── route.dart              # Defines application routes
> Overview
> 
    |   |-- lib
    |   |   |-- i18n
    |   |   |   '-- i18n.dart
    |   |   |-- main.dart
    |   |   |-- route.dart
    |   |   '-- src
    |   |       |-- app.dart
    |   |       |-- application
    |   |       |   '-- core
    |   |       |       |-- base_view_model.dart
    |   |       |       '-- base_view_model.g.dart
    |   |       |-- domain
    |   |       |   '-- core
    |   |       |       |-- api.dart
    |   |       |       |-- navigator
    |   |       |       |   '-- navigation_service.dart
    |   |       |       '-- value_objects
    |   |       |           '-- enum_values.dart
    |   |       |-- infrastructure
    |   |       |   '-- core
    |   |       |       |-- http_client
    |   |       |       |   |-- api_endpoints.dart
    |   |       |       |   '-- dio_builder.dart
    |   |       |       '-- navigator
    |   |       |           '-- default_navigation_service.dart
    |   |       |-- injection
    |   |       |   |-- config.dart
    |   |       |   |-- injectable_module.dart
    |   |       |   '-- injection.dart
    |   |       |-- presentation
    |   |       |   |-- core
    |   |       |   |   |-- animation_route.dart
    |   |       |   |   |-- components
    |   |       |   |   |   |-- base_component.dart
    |   |       |   |   |   |-- bottom_sheet_container.dart
    |   |       |   |   |   |-- default_app_bar.dart
    |   |       |   |   |   '-- icon.dart
    |   |       |   |   |-- functions.dart
    |   |       |   |   '-- transparent_page_route.dart
    |   |       |   |-- empty_screen.dart
    |   |       |   '-- splash_screen.dart
    |   |       '-- utils
    |   |           |-- color_util.dart
    |   |           |-- constants.dart
    |   |           |-- size_util.dart
    |   |           '-- theme_util.dart
    |   |-- pubspec.yaml
    |   '-- test
    |       '-- widget_test.dart
## Note

When creating a flutter project I adopted certain patterns of developments, folder structures and others
Settings that help me build applications: testable, scalable, and easy to maintain.

In most of my works the architecture is the same, the design pattern is the same, the management
state is the same and has dependencies that I use almost by default.

In this way I created this library in order to automate my work, with just a few commands I created all
The structure needed to get a Flutter project ready to run. 