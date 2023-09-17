
# api_crud_app
A new Flutter API CRUD PROJECT. ✅
## Getting Started

[mockAPI](https://mockapi.io/) used as an api. 

### Api Schema

![Ekran Resmi 2023-09-17 19 46 23](https://github.com/umutbariscoskun/ApiCrudAPP/assets/45595606/ebe6d300-8665-41d4-a486-288b78281566)


### ARCHITECTURE: 

- Clean Architecture

![image](https://github.com/umutbariscoskun/ApiCrudAPP/assets/45595606/9e8d7eec-8de0-416f-ad1b-eee5a4561a61)


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
 
![Simulator Screen Shot - iPhone SE (3rd generation) - 2023-09-17 at 14 40 53](https://github.com/umutbariscoskun/ApiCrudAPP/assets/45595606/1eb26b56-e2c5-41e6-84de-03553b2f2b66)
![Simulator Screen Shot - iPhone SE (3rd generation) - 2023-09-17 at 14 40 47](https://github.com/umutbariscoskun/ApiCrudAPP/assets/45595606/472b35a3-d8de-4966-a418-0fcf0dba67ad)
![Simulator Screen Shot - iPhone SE (3rd generation) - 2023-09-17 at 14 40 41](https://github.com/umutbariscoskun/ApiCrudAPP/assets/45595606/16b9663d-985a-4891-b489-7acd65d06390)
![Simulator Screen Shot - iPhone SE (3rd generation) - 2023-09-17 at 14 40 33](https://github.com/umutbariscoskun/ApiCrudAPP/assets/45595606/a7135c5a-d812-45ea-a522-d75cc83b8eb1)





 
# ApiCrudAPP
