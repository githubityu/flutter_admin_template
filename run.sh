 dart run build_runner build --delete-conflicting-outputs
flutter run -d chrome --web-hostname 10.168.19.130 --web-port 8080

flutter pub deps

flutter packages upgrade
#### 升级包
flutter pub upgrade --major-versions

firebase login --debug --no-localhost

export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

dart pub global activate flutterfire_cli

export PATH="$PATH":"$HOME/.pub-cache/bin"

flutterfire configure


pod install


firebase apps:list ios --json --project=home-services-by-advancer

flutter config --enable-web

##facebook
keytool -exportcert -alias advancer -keystore /Users/yujunlong/AndroidStudioProjects/easy_home/android/app/easy_home.jks | openssl sha1 -binary | openssl base64