# Fleetdesk_Flutter
 A demo task list

* For All supported devices: git@github.com:utsav-savani/nCompass_code_task.git

## Tasks Done

 Requirements
 ```
Frontend App

 As a user I want to be able to identify which tasks I haven't completed yet.
 As a user I want to be able to see which tasks I have already completed.
 As a user I want to be able to mark a completed task and get visual feedback on that change.
 As a user I want to be able to register new tasks.
 As a user I want to be able to change the description of a task.
 As a user I want to be able to delete a task.
 As a user I want to be able to see a report of my tasks by status.
Backend App

 Tasks must be persisted in some database. (At candidate's discretion).
General

 Free Design/Layout
 Using Git, make your solution available on github with a readme describing how to run your project :)
 Unit testing is a bonus
 Make the application installation apk available in git (Android)
 
## NOTE
```
* Internet connection is must as firebase is used for database
```

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/utsav-savani/Fleetdesk_Flutter.git

```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```
**Step 3:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter run
```

### Libraries & Tools Used

* [firebase_auth](https://pub.dev/packages/firebase_auth)
* [firebase_core](https://pub.dev/packages/firebase_core)
* [Database](https://pub.dev/packages/cloud_firestore)
* [Get](https://pub.dev/packages/get) (State Management)
* [Chart for reports](https://pub.dev/packages/syncfusion_flutter_charts)


### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure used in this project

```
lib/
|- core/common/
|- data/
|- domain/controllers
|- presentation/
|- main.dart

```


## Building apk

**Step 1:**

Run the following commands in the terminal
For Android Build
```
flutter build apk
```
For iOS Build
```
flutter build ipa
```
**Step 2:**

For Android navigate to
```
Go to project\build\app\outputs\flutter-apk\myAppName.apk
```


## Link to download APK
```
https://github.com/utsav-savani/Fleetdesk_Flutter/raw/main/app-release.apk
```
