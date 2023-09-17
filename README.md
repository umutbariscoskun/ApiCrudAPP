
# api_crud_app
A new Flutter API CRUD PROJECT.

[mockAPI](https://mockapi.io/) used as an api. 


## Getting Started

### ARCHITECTURE: 

- Clean Architecture

![image](https://github.com/umutbariscoskun/ApiCrudAPP/assets/45595606/361e6836-c52e-4f4e-a3c1-b5b400d1faa2)

[You can find more about this architecture in my article.](https://medium.com/@umutbariscoskun/flutter-clean-architecture-paketi-ve-mimari-kullan%C4%B1m%C4%B1-beae4d09e0c3)



### ENVIRONMENTS

#### TEST, UAT, PROD

/// run in terminal for example: `make run-ios-debug-test`

run-ios-debug-test:
	flutter run --target lib/main.dart --flavor test --dart-define=APP_ENV=test

run-android-debug-dev:
	flutter run --target lib/main.dart --flavor dev --dart-define=APP_ENV=test

run-debug-uat:
	flutter run --target lib/main.dart --flavor uat --dart-define=APP_ENV=uat

 run-debug-prod:
	flutter run --target lib/main.dart --flavor prod --dart-define=APP_ENV=prod

 #### RUNNING ENVIRONMENTS FROM TERMINAL 
 
 ##### YOU CAN RUN THEM DIRECTLY FROM VISUAL STUDIO CODE LAUNCH SETTINGS 
 
 ![Ekran Resmi 2023-09-17 15 04 20](https://github.com/umutbariscoskun/ApiCrudAPP/assets/45595606/24214ae6-de91-4803-8b76-75effb064288)
 
 ###### (EXCEPT ANDROID IN TEST MODE BECAUSE OF TEST KEYWORD, GRADLE WONT ACCEPT IT. FOR RUNNING ANDROID-DEV PLEASE USE MAKE COMMANDS)


 `make run-ios-debug-test`
 
 `make run-android-debug-dev`
 
 `make run-debug-uat`
 
 `make run-debug-prod`
 
 

 ### Localization: 
 
 You have to change locale& country on ios to change app locale 

 ### Unit Testing: 
 
 Unit tests created for all of usecases `flutter test` 
 
 ## PACKAGES
 ##### FOR ROUTER:
 
- [auto_route](https://pub.dev/packages/auto_route)
- [auto_route_generator](https://pub.dev/packages/auto_route_generator)
  
 ##### FOR DEPENDENCY INJECTION:
 
- [Get_it](https://pub.dev/packages/get_it)
- [Injectable](https://pub.dev/packages/injectable)
- [injectable_generator](https://pub.dev/packages/injectable_generator)
  
 ##### FOR State Management & Business logic:
 
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [equatable](https://pub.dev/packages/equatable)
- [dartz](https://pub.dev/packages/dartz)
  
 ##### FOR NETWORKING:
 
- [retrofit](https://pub.dev/packages/retrofit)
- [retrofit_generator](https://pub.dev/packages/retrofit_generator)
- [dio](https://pub.dev/packages/dio)
  
  ##### FOR UI:
  
- [retrofit](https://pub.dev/packages/flutter_screenutil)
- [gap](https://pub.dev/packages/gap)
- [modal_bottom_sheet](https://pub.dev/packages/modal_bottom_sheet)
- [lottie](https://pub.dev/packages/lottie)
- [build_runner](https://pub.dev/packages/build_runner)
  
 ##### FOR LOCALIZATION:
 
- [easy_localization](https://pub.dev/packages/easy_localization)
  
 ##### FOR UNIT TESTING:
 
- [mockito](https://pub.dev/packages/mockito)

 ### UI

![Simulator Screen Shot - iPhone SE (3rd generation) - 2023-09-17 at 14 40 53](https://github.com/umutbariscoskun/ApiCrudAPP/assets/45595606/b1c81292-4aef-4faf-b56d-e6c9c068ff76)
![Simulator Screen Shot - iPhone SE (3rd generation) - 2023-09-17 at 14 40 47](https://github.com/umutbariscoskun/ApiCrudAPP/assets/45595606/54007642-9bd8-4bc5-9803-db736fe1714d)
![Simulator Screen Shot - iPhone SE (3rd generation) - 2023-09-17 at 14 40 41](https://github.com/umutbariscoskun/ApiCrudAPP/assets/45595606/e69130e1-d1a6-4c8c-bf32-66ea51a54a5d)
![Simulator Screen Shot - iPhone SE (3rd generation) - 2023-09-17 at 14 40 33](https://github.com/umutbariscoskun/ApiCrudAPP/assets/45595606/bc2958e4-d3e2-4bdf-9a98-88911c06590a)



 
# ApiCrudAPP
