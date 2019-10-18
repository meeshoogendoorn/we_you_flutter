# we_you_flutter  

This app is created with Flutter.  
Main purpose of the app is handling the quiz sessions for the company Home4Talent.  
  
### Directory Structure   
```
├── survey_app
│   ├── android
│   ├── assets
│   │   ├── gifs   
│   │   ├── images   
│   ├── build
│   ├── ios
│   ├── lib
│   │   ├── Containers  => Data for temporary states
│   │   ├── Data	    => Handlers for data from REST API
│   │   ├── Pages       => Pages for the app
│   │   ├── Utils       => Contains the Utilities for this app 
│   │   ├── Widgets     => Widget components
│   │   ├── main.dart   => root of the app
│   ├── test
│   ├── .gitignore
│   ├── .metadata
│   ├── .packages
│   ├── pubspec.yaml => Packages of the app
```

### Packages
>[http](https://pub.dev/packages/http)

A composable, Future-based library for making HTTP requests.

>[provider](https://pub.dev/packages/provider)

A mixture between dependency injection (DI) and state management, built with widgets for widgets.

>[charts_flutter](https://pub.dev/packages/charts_flutter)

Material Design data visualization library written natively in Dart.

>[rich_alert](https://pub.dev/packages/rich_alert)

An alert dialog package for the "rich". This package helps you to render an modern alert dialog in your Flutter app

>[font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter)

Font Awesome library for flutter

>[intro_views_flutter](https://pub.dev/packages/intro_views_flutter)

Creating beautiful intro views for flutter

>[gradient_app_bar](https://pub.dev/packages/gradient_app_bar)

Used to display an gradient header bar that is changeable on initialize

>[wave](https://pub.dev/packages/wave)

Package for providing wave animation in the app


### Restful API 
>API specs

`dependecies`
python 3.6 django 2.2 rest framework 3.10.3

>API connection with App
>
`API -> APP`
The app is connected to the API to retrieve data and save data to the database of Home4Talent. 

`Authentication`
The API uses Basic http authentication (Basic Auth). The authentication in the app is handled by 3 classes:

 1. Pages/login.dart => View
 2. Utils/loginPresenter.dart => Presenter
 3. Data/restDataSource.dart => Handler



