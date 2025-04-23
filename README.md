# flutter_pomodoro_timer

Pomodoro timer in Flutter

## Run in Docker container

In VSCode you can open this project in a Docker container using Dev Containers extesion.

Once inside the container you can run the app via adb debugging (wifi)

- make sure both the Android device and your computer are connected to the same WiFi
- on your Android device go under *"System" > "Developer options" > "Debug wireless"* and click on *"Pair device with pairing code"*
- run the project inside the container and run

```sh
adb pair [ip]:[port]
```

*ip* and *port* are given by the device when clicking on *"Pair device with pairing code"*

- enter the pairing code
- on your android device close the pairing screen and look at the *"IP address and port"*

```sh
adb connect [ip]:[port]
adb devices
flutter run -d 192.168.0.102:40945
```

to run in debug mode add the following config inside .vscode/launch.json

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Flutter on Device",
      "type": "dart",
      "request": "launch",
      "flutterMode": "debug",
      "deviceId": "192.168.0.102:40945"
    }
  ]
}
```