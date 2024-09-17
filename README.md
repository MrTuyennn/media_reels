# media_reels

Media reels

## Getting Started


#### Structuring the Project

lib/
├── bloc/
│ ├── bloc_theme/
│ └── bloc_auth/
├── core/
│ -- app_bloc -- app_container -- app_router
├── l10n/
└── components/
├── models/
│ ├── model_user/
│ └── model_products/
├── networks
│ -- dio_client -- error_code -- global_interceptors
├── repository
│ -- repository_auth -- repository_products
├── utils

#### bloc : 
 - handle logic state management

#### core ;
 - handle info app and data save local

#### l10n : 
 - handle multiple languages

#### components : 
 - component using for all apps

#### models
 - create and handle logic of that object

#### network : 
 - setup network Dio call api and check error Dio

#### repositoty :
 - receive data from server

#### utils :
 - logic for all apps 



#### flutter pub ####
 ** flutter pub run build_runner build --> run freezed
 ** flutter pub upgrade --> update pub
 ** flutter pub add ...--> add pub
 ** flutter clean && flutter pub get && cd ./ios && rm -rf ./Pods && rm Podfile.lock && pod install && open Runner.xcworkspace && cd .. --> clear and restart Xcode


#### build app ANDROID ####
flutter build apk --release --dart-define-from-file=.env/development.env
flutter build apk --release --dart-define-from-file=.env/production.env


#### build app IOS ####
flutter build ipa --release --dart-define-from-file=.env/development.env
flutter build ipa --release --dart-define-from-file=.env/production.envn  