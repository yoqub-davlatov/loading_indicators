# 🏆 Animated Loading Indicators

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/yoqub-davlatov/loading_indicators/blob/main/LICENSE)

A collection of animated loading indicators that bring a delightful user experience to your applications. The collection has curated a diverse selection of loading indicators, ranging from unique designs to enhanced functionalities. Each indicator is carefully crafted to provide visual feedback during data fetching or processing, ensuring a seamless and engaging user interface. Very light and easy to use!

## ✔️ Installing

```yaml
dependencies:
  animated_loading_indicators: ^0.0.1
```

## ➕ Import

```dart
import 'package:animated_loading_indicators/animated_loading_indicators.dart';
```

## 💻 How To Use

```dart
const pacmanLoader = PacmanLoader(
  size: 40,
  duration: Duration(milliseconds: 450),
  mainColor: Colors.red,
  borderColor: Colors.transparent,
  eyeColor: Colors.white,
  isStatic: true,
);
```

```dart
const infiniteCradle = InfiniteCradle(
  size: 50,
  color: Colors.red,
  duration: Duration(seconds: 1),
);
```

For more usecase info, please, refer to the `main.dart` in the example folder.

## 🍰 Demo

<table>
  <tr>
    <td align="center">
      <img src="https://github.com/yoqub-davlatov/loading_indicators/blob/main/example/screenshots/infinite_cradle.gif" width="100px" height="100px">
      <br />
      InfiniteCradle
    </td>
    <td align="center">
      <img src="https://github.com/yoqub-davlatov/loading_indicators/blob/main/example/screenshots/clock_loader.gif" width="100px" height="100px">
      <br />
      ClockLoader
    </td>
    <td align="center">
      <img src="https://github.com/yoqub-davlatov/loading_indicators/blob/main/example/screenshots/three_icons.gif" width="100px" height="100px">
      <br />
      ThreeIcons
    </td>
    <td align="center">
      <img src="https://github.com/yoqub-davlatov/loading_indicators/blob/main/example/screenshots/yingyang.gif" width="100px" height="100px">
      <br />
      YingYang
    </td>
    <td align="center">
      <img src="https://github.com/yoqub-davlatov/loading_indicators/blob/main/example/screenshots/text_loader.gif" width="100px" height="21px">
      <br />
      TextLoader
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/yoqub-davlatov/loading_indicators/blob/main/example/screenshots/flip_icons.gif" width="100px" height="100px">
      <br />
      FlipIcons
    </td>
    <td align="center">
      <img src="https://github.com/yoqub-davlatov/loading_indicators/blob/main/example/screenshots/pacman.gif" width="100px" height="100px">
      <br />
      Pacman
    </td>
  </tr>
  <tr>
  <td align="center">
    <img src="https://github.com/yoqub-davlatov/loading_indicators/blob/main/example/screenshots/percentage.gif" width="50px" height="100px">
    <br />
    Percentage indicator
  </td>
</tr>

</table>

## 🆘 Requests

If you have faced with any issues or you have any recommendations, please fork the project and send a pull request with your comments.

### ❗️ Note

For help getting started with Flutter, view the online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).

## 📰 License

[MIT License](https://github.com/yoqub-davlatov/loading_indicators/blob/main/LICENSE).

## ✍️ Authors

- Azizullo Sadriddinzoda (a.sadriddinzoda@innopolis.university)
- Anushervon Qodirzoda (a.qodirzoda@innopolis.university)
- Habibullo Assoev (h.assoev@innopolis.university)
- Yoqub Davlatov (y.davlatov@innopolis.university)
