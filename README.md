# 🏆 Flutter Loading Indicators
<!--
[![Format, Analyze and Test](https://github.com/jogboms/flutter_spinkit/actions/workflows/main.yml/badge.svg)](https://github.com/jogboms/flutter_spinkit/actions/workflows/main.yml) [![codecov](https://codecov.io/gh/jogboms/flutter_spinkit/branch/master/graph/badge.svg)](https://codecov.io/gh/jogboms/flutter_spinkit) [![pub package](https://img.shields.io/pub/v/flutter_spinkit.svg)](https://pub.dartlang.org/packages/flutter_spinkit)
-->
A collection of animated loading indicators with flutter.

## ✔️ Installing

```yaml
dependencies:
  animated_loading_indicators: ^0.0.1
```

## ➕ Import

```dart
import 'package:animated_loading_indicators/loading_indicators.dart';
```

## 💻 How To Use

```dart
const clockLoader = ClockLoader(
  frameColor: Colors.deepOrange,
  minuteColor: Colors.blue,
  hourColor: Colors.green,
);
```

```dart
const threeDots = ThreeIconsLoading(
  size: 25,
  icon: Icons.circle,
  iconColor1: Colors.red,
  iconColor2: Colors.yellow,
  iconColor3: Colors.green,
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
</table>

## 🆘 Requests

If you have faced with any issues or you have any recommendations, please fork the project and send a pull request with your comments.

### ❗️ Note

For help getting started with Flutter, view the online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).
## 📰 License

[MIT License](https://flutter.io/](https://github.com/yoqub-davlatov/loading_indicators/blob/main/LICENSE)https://github.com/yoqub-davlatov/loading_indicators/blob/main/LICENSE).
